<?php

namespace App\Http\Resources;

use App\Models\SiteSetting;
use App\Support\WebsiteContent;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

/** @mixin SiteSetting */
class SettingsResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        $data = ['id' => $this->id, 'site_title' => $this->site_title, 'tagline' => $this->tagline, 'introduction' => $this->introduction, 'contact_email' => $this->contact_email, 'availability' => $this->availability, 'default_seo_title' => $this->default_seo_title, 'default_seo_description' => $this->default_seo_description, 'social_links' => $this->social_links, 'logo' => MediaResource::ready($this->logo), 'created_at' => $this->created_at->toISOString(), 'updated_at' => $this->updated_at->toISOString()];
        $admin = $request->is('api/v1/admin/*');
        $data['social_links'] = WebsiteContent::ordered($this->social_links, $admin);
        $footer = $this->footer;
        if ($footer !== null) {
            if (isset($footer['established_year'])) {
                $footer['established_year'] = (int) $footer['established_year'];
            }
            foreach (['footer_links', 'practice_links'] as $key) {
                $footer[$key] = WebsiteContent::ordered($footer[$key] ?? [], $admin);
            }
        }
        $data += ['phone' => $this->phone, 'location' => $this->location, 'availability_text' => $this->availability_text, 'logo_light' => MediaResource::ready($this->logoLight), 'logo_dark' => MediaResource::ready($this->logoDark), 'favicon' => MediaResource::ready($this->favicon), 'navigation' => WebsiteContent::ordered($this->navigation ?? [], $admin), 'footer' => $footer, 'shared_cta' => $this->shared_cta, 'legal_links' => $this->legal_links === null ? null : (object) $this->legal_links];
        if ($request->is('api/v1/admin/*')) {
            $data['logo_media_id'] = $this->logo_media_id;
            $data += ['logo_light_media_id' => $this->logo_light_media_id, 'logo_dark_media_id' => $this->logo_dark_media_id, 'favicon_media_id' => $this->favicon_media_id];
        }

        return $data;
    }
}
