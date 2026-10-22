<?php

namespace App\Jobs;

use App\Models\Media;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Queue\Queueable;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class DeleteMedia implements ShouldQueue
{
    use Queueable;

    public int $tries = 5;

    public int $timeout = 60;

    public function __construct(public int $mediaId) {}

    public function backoff(): array
    {
        return [10, 60, 180, 600];
    }

    public function handle(): void
    {
        DB::transaction(function () {
            $m = Media::whereKey($this->mediaId)->lockForUpdate()->first();
            if (! $m || $m->status !== 'deleting') {
                return;
            }
            if ($m->usageCount()) {
                throw new \RuntimeException('Referenced media cannot be deleted.');
            }
            $disk = Storage::disk($m->disk);
            foreach ([$m->variantKey(), $m->variantKey('thumbnail')] as $path) {
                if ($disk->exists($path) && ! $disk->delete($path)) {
                    throw new \RuntimeException('Storage deletion failed.');
                }
            }
            $input = 'uploads/'.$m->storage_key;
            $local = Storage::disk('local');
            if ($local->exists($input) && ! $local->delete($input)) {
                throw new \RuntimeException('Temporary file deletion failed.');
            }
            $m->delete();
        }, 3);
    }
}
