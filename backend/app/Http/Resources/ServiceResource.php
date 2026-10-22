<?php

namespace App\Http\Resources;

use App\Models\Service;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

/** @mixin Service */
class ServiceResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        $data = ['id' => $this->id, 'slug' => $this->slug, 'title' => $this->title, 'summary' => $this->summary, 'description' => $this->description, 'icon_key' => $this->icon_key, 'sort_order' => $this->sort_order, 'created_at' => $this->created_at->toISOString(), 'updated_at' => $this->updated_at->toISOString()];
        if ($request->is('api/v1/admin/*')) {
            $data['is_active'] = $this->is_active;
        }

        return $data;
    }
}
