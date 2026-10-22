<?php

namespace App\Jobs;

use App\Models\Media;
use App\Services\ImageInspector;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Queue\Queueable;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Throwable;

class ProcessMedia implements ShouldQueue
{
    use Queueable;

    public int $tries = 3;

    public int $timeout = 60;

    public function __construct(public int $mediaId) {}

    public function backoff(): array
    {
        return [10, 60, 180];
    }

    public function handle(ImageInspector $inspector): void
    {
        DB::transaction(function () use ($inspector) {
            $m = Media::whereKey($this->mediaId)->lockForUpdate()->first();
            if (! $m || $m->status !== 'processing') {
                return;
            }
            $path = Storage::disk('local')->path('uploads/'.$m->storage_key);
            $inspector->inspect($path);
            $image = imagecreatefromstring(file_get_contents($path));
            if ($image === false) {
                throw new \RuntimeException('Image decode failed.');
            }
            try {
                $display = $this->encode($image);
                $scale = min(1, 480 / imagesx($image), 480 / imagesy($image));
                $thumb = imagescale($image, max(1, (int) floor(imagesx($image) * $scale)), max(1, (int) floor(imagesy($image) * $scale)));
                if ($thumb === false) {
                    throw new \RuntimeException('Thumbnail generation failed.');
                }
                try {
                    $thumbnail = $this->encode($thumb);
                } finally {
                    imagedestroy($thumb);
                }
                $disk = Storage::disk($m->disk);
                if (! $disk->put($m->variantKey(), $display) || ! $disk->put($m->variantKey('thumbnail'), $thumbnail)) {
                    throw new \RuntimeException('Storage write failed.');
                }
                $m->update(['status' => 'ready']);
            } finally {
                imagedestroy($image);
            }
        }, 3);
        $m = Media::find($this->mediaId);
        if ($m && $m->status === 'ready') {
            Storage::disk('local')->delete('uploads/'.$m->storage_key);
        }
    }

    private function encode(\GdImage $image): string
    {
        ob_start();
        try {
            if (! imagewebp($image, null, 85)) {
                throw new \RuntimeException('Encoding failed.');
            }

            return (string) ob_get_contents();
        } finally {
            ob_end_clean();
        }
    }

    public function failed(?Throwable $exception): void
    {
        DB::transaction(function () {
            $m = Media::whereKey($this->mediaId)->lockForUpdate()->first();
            if (! $m || $m->status !== 'processing') {
                return;
            }
            $m->update(['status' => 'failed']);
        });
        $m = Media::find($this->mediaId);
        if ($m && $m->status === 'failed') {
            Storage::disk('local')->delete('uploads/'.$m->storage_key);
            Storage::disk($m->disk)->delete([$m->variantKey(), $m->variantKey('thumbnail')]);
        }
    }
}
