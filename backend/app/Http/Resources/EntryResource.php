<?php

namespace App\Http\Resources;

use App\Models\PortfolioEntry;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

/** @mixin PortfolioEntry */
class EntryResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        $admin = $request->is('api/v1/admin/*');
        $data = ['id' => $this->id, 'kind' => $this->kind, 'slug' => $this->slug, 'title' => $this->title, 'summary' => $this->summary, 'featured' => $this->featured, 'sort_order' => $this->sort_order, 'repository_url' => $this->repository_url, 'demo_url' => $this->demo_url, 'external_url' => $this->external_url, 'cover' => MediaResource::ready($this->cover), 'category' => $this->category ? new CategoryResource($this->category) : null, 'technologies' => TechnologyResource::collection($this->technologies), 'published_at' => $this->published_at?->toISOString(), 'seo_title' => $this->title, 'seo_description' => $this->summary, 'created_at' => $this->created_at->toISOString(), 'updated_at' => $this->updated_at->toISOString()];
        if ($admin || $request->route('slug') !== null) {
            $data += ['description' => $this->description, 'gallery' => $this->gallery->filter(fn ($m) => $m->status === 'ready')->map(fn ($m) => ['media' => new MediaResource($m), 'alt_text' => $m->pivot->getAttribute('alt_text'), 'sort_order' => (int) $m->pivot->getAttribute('sort_order')])->values(), 'contributors' => TeamMemberResource::collection($this->contributors)];
        }
        if ($admin) {
            $data += ['status' => $this->status, 'category_id' => $this->category_id, 'cover_media_id' => $this->cover_media_id];
        }

        return $data;
    }
}
