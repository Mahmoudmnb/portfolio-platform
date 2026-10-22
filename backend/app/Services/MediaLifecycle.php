<?php

namespace App\Services;

use App\Jobs\DeleteMedia;
use App\Models\Media;
use App\Support\ApiException;
use App\Support\Audit;
use Illuminate\Support\Facades\DB;

class MediaLifecycle
{
    public function delete(int $id, bool $orphanOnly = false): bool
    {
        return DB::transaction(function () use ($id, $orphanOnly) {
            $media = Media::whereKey($id)->lockForUpdate()->first();
            if (! $media) {
                return false;
            }
            if ($orphanOnly && $media->created_at->greaterThanOrEqualTo(now()->subDay())) {
                return false;
            }
            if ($media->usageCount() > 0) {
                if ($orphanOnly) {
                    return false;
                } throw new ApiException('Media is referenced by content.');
            }
            if ($media->status !== 'deleting') {
                $media->update(['status' => 'deleting']);
                Audit::record('deletion_requested', $media);
            }
            DeleteMedia::dispatch($media->id)->afterCommit();

            return true;
        }, 3);
    }
}
