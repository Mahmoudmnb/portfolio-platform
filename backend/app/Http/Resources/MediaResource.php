<?php

namespace App\Http\Resources;

use App\Models\Media;
use App\Support\ContentTypes;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

/** @mixin Media */
class MediaResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        $admin = $request->is('api/v1/admin/*');
        $data = ['id' => $this->id, 'width' => $this->width, 'height' => $this->height, 'url' => $this->status === 'ready' ? Storage::disk($this->disk)->url($this->variantKey()) : null, 'thumbnail_url' => $this->status === 'ready' ? Storage::disk($this->disk)->url($this->variantKey('thumbnail')) : null];
        $data += ['alt' => $this->alt_text, 'file_size' => $this->display_bytes, 'mime_type' => $admin ? $this->mime_type : 'image/webp', 'display_mime_type' => 'image/webp'];
        if ($admin) {
            $data += ['status' => $this->status, 'original_filename' => $this->original_filename, 'bytes' => $this->bytes, 'usage_count' => array_sum(array_map(fn ($relation) => (int) $this->resource->getAttribute(Str::snake($relation).'_count'), ContentTypes::MEDIA_USAGE)), 'failure_message' => $this->status === 'failed' ? 'Image processing failed. Upload the image again.' : null, 'created_at' => $this->created_at->toISOString(), 'updated_at' => $this->updated_at->toISOString()];
        }

        return $data;
    }

    public static function ready(?Media $media): ?self
    {
        return $media && $media->status === 'ready' ? new self($media) : null;
    }
}
