<?php

namespace App\Http\Resources;

use App\Models\Media;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Storage;

/** @mixin Media */
class MediaResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        $admin = $request->is('api/v1/admin/*');
        $data = ['id' => $this->id, 'width' => $this->width, 'height' => $this->height, 'url' => $this->status === 'ready' ? Storage::disk($this->disk)->url($this->variantKey()) : null, 'thumbnail_url' => $this->status === 'ready' ? Storage::disk($this->disk)->url($this->variantKey('thumbnail')) : null];
        if ($admin) {
            $data += ['status' => $this->status, 'original_filename' => $this->original_filename, 'mime_type' => $this->mime_type, 'bytes' => $this->bytes, 'usage_count' => (int) ($this->gallery_entries_count + $this->cover_entries_count + $this->members_count + $this->settings_count), 'failure_message' => $this->status === 'failed' ? 'Image processing failed. Upload the image again.' : null, 'created_at' => $this->created_at->toISOString(), 'updated_at' => $this->updated_at->toISOString()];
        }

        return $data;
    }

    public static function ready(?Media $media): ?self
    {
        return $media && $media->status === 'ready' ? new self($media) : null;
    }
}
