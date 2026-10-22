<?php

namespace App\Http\Requests;

use App\Enums\Availability;
use App\Enums\EntryKind;
use App\Enums\PublicationStatus;
use App\Rules\ContentUrl;
use Illuminate\Validation\Rule;

class ContentRequest extends StrictRequest
{
    public function rules(): array
    {
        $type = $this->route('resource');
        $id = $this->route('id');
        $required = $this->isMethod('POST') || $type === 'site-settings' ? 'required' : 'sometimes';
        $text = fn ($n) => [$required, 'string', 'max:'.$n];
        $slug = ['sometimes', 'string', 'max:160', 'regex:/^[a-z0-9]+(?:-[a-z0-9]+)*$/', Rule::unique(match ($type) {
            'entries' => 'portfolio_entries',default => str_replace('-', '_', $type)
        }, 'slug')->ignore($id)];
        $url = ['sometimes', 'nullable', 'string', 'max:2048', new ContentUrl];
        $sort = ['sometimes', 'integer', 'between:-1000000,1000000'];
        $links = ['sometimes', 'array', 'max:10'];
        $linkFields = ['links' => $links, 'links.*' => ['array:label,url,sort_order'], 'links.*.label' => ['required', 'string', 'max:80'], 'links.*.url' => ['required', 'string', 'max:2048', new ContentUrl], 'links.*.sort_order' => ['sometimes', 'integer', 'between:-1000000,1000000']];

        return match ($type) {
            'entries' => [
                'kind' => [$required, Rule::enum(EntryKind::class)], 'slug' => $slug, 'title' => $text(180), 'summary' => $text(500), 'description' => $text(50000),
                'category_id' => ['sometimes', 'nullable', 'integer', 'exists:categories,id'], 'status' => ['sometimes', Rule::enum(PublicationStatus::class)],
                'published_at' => ['sometimes', 'nullable', 'date', 'before_or_equal:now'], 'featured' => ['sometimes', 'boolean'], 'sort_order' => $sort,
                'cover_media_id' => ['sometimes', 'nullable', 'integer', 'exists:media,id'], 'repository_url' => $url, 'demo_url' => $url, 'external_url' => $url,
                'technology_ids' => ['sometimes', 'array', 'max:30'], 'technology_ids.*' => ['required', 'integer', 'distinct', 'exists:technologies,id'],
                'contributor_ids' => ['sometimes', 'array', 'max:30'], 'contributor_ids.*' => ['required', 'integer', 'distinct', 'exists:team_members,id'],
                'gallery' => ['sometimes', 'array', 'max:20'], 'gallery.*' => ['array:media_id,alt_text,sort_order'], 'gallery.*.media_id' => ['required', 'integer', 'distinct', 'exists:media,id'],
                'gallery.*.alt_text' => ['required', 'string', 'max:500'], 'gallery.*.sort_order' => ['sometimes', 'integer', 'between:-1000000,1000000'],
            ],
            'categories' => ['slug' => $slug, 'name' => $text(120), 'description' => ['sometimes', 'nullable', 'string', 'max:1000'], 'sort_order' => $sort],
            'technologies' => ['slug' => $slug, 'name' => $text(120), 'website_url' => $url],
            'team-members' => array_merge(['slug' => $slug, 'name' => $text(120), 'role_title' => $text(180), 'bio' => $text(10000), 'photo_media_id' => ['sometimes', 'nullable', 'integer', 'exists:media,id'], 'is_active' => ['sometimes', 'boolean'], 'sort_order' => $sort], $linkFields),
            'services' => ['slug' => $slug, 'title' => $text(180), 'summary' => $text(500), 'description' => $text(20000), 'icon_key' => ['sometimes', 'nullable', 'string', 'max:80', 'regex:/^[a-z][a-z0-9_-]*$/'], 'is_active' => ['sometimes', 'boolean'], 'sort_order' => $sort],
            'site-settings' => [
                'site_title' => $text(180), 'tagline' => $text(500), 'introduction' => $text(10000), 'contact_email' => [$required, 'email', 'max:254'],
                'availability' => [$required, Rule::enum(Availability::class)], 'logo_media_id' => ['sometimes', 'nullable', 'integer', 'exists:media,id'],
                'default_seo_title' => $text(180), 'default_seo_description' => $text(500), 'social_links' => ['present', 'array', 'max:10'],
                'social_links.*' => ['array:label,url,sort_order'], 'social_links.*.label' => ['required', 'string', 'max:80'], 'social_links.*.url' => ['required', 'string', 'max:2048', new ContentUrl],
                'social_links.*.sort_order' => ['sometimes', 'integer', 'between:-1000000,1000000'],
            ],
            default => []
        };
    }
}
