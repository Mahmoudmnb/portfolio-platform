<?php

namespace App\Http\Resources;

use App\Models\TeamMember;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

/** @mixin TeamMember */
class TeamMemberResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        $data = ['id' => $this->id, 'slug' => $this->slug, 'name' => $this->name, 'role_title' => $this->role_title, 'bio' => $this->bio, 'sort_order' => $this->sort_order, 'photo' => MediaResource::ready($this->photo), 'links' => $this->links->map(fn ($l) => ['label' => $l->label, 'url' => $l->url, 'sort_order' => $l->sort_order]), 'created_at' => $this->created_at->toISOString(), 'updated_at' => $this->updated_at->toISOString()];
        if ($request->is('api/v1/admin/*')) {
            $data += ['is_active' => $this->is_active, 'photo_media_id' => $this->photo_media_id];
        }

        return $data;
    }
}
