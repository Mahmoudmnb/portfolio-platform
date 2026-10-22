<?php

namespace App\Http\Resources;

use App\Models\SiteSetting;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

/** @mixin SiteSetting */
class SettingsResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        $data = ['id' => $this->id, 'site_title' => $this->site_title, 'tagline' => $this->tagline, 'introduction' => $this->introduction, 'contact_email' => $this->contact_email, 'availability' => $this->availability, 'default_seo_title' => $this->default_seo_title, 'default_seo_description' => $this->default_seo_description, 'social_links' => $this->social_links, 'logo' => MediaResource::ready($this->logo), 'created_at' => $this->created_at->toISOString(), 'updated_at' => $this->updated_at->toISOString()];
        if ($request->is('api/v1/admin/*')) {
            $data['logo_media_id'] = $this->logo_media_id;
        }

        return $data;
    }
}
