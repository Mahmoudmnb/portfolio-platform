<?php

namespace App\Http\Resources;

use App\Models\Page;
use App\Support\WebsiteContent;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

/** @mixin Page */
class PageResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        $admin = $request->is('api/v1/admin/*');
        $content = $this->content;
        foreach ($content as $key => $section) {
            if (in_array($key, ['section_headings', 'form'], true)) {
                $content[$key] = (object) $section;
            } elseif (is_array($section) && array_is_list($section)) {
                $content[$key] = WebsiteContent::ordered($section, $admin);
            }
        }
        $seo = $this->seo;
        $seo += ['canonical_url' => null, 'og_title' => $seo['title'], 'og_description' => $seo['meta_description'], 'twitter_title' => null, 'twitter_description' => null, 'robots_index' => true, 'robots_follow' => true];
        $seo['robots_index'] = (bool) $seo['robots_index'];
        $seo['robots_follow'] = (bool) $seo['robots_follow'];
        $seo['og_image'] = MediaResource::ready($this->ogImage);
        $data = ['page_key' => $this->page_key, 'locale' => 'en', 'content' => $content, 'seo' => $seo, 'featured_projects' => EntryResource::collection($this->featuredEntries), 'created_at' => $this->created_at->toISOString(), 'updated_at' => $this->updated_at->toISOString()];
        if ($admin) {
            $data += ['status' => $this->status, 'og_image_media_id' => $this->og_image_media_id, 'featured_entry_ids' => $this->featuredEntries->modelKeys()];
        }

        return $data;
    }
}
