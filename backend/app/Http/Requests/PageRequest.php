<?php

namespace App\Http\Requests;

use App\Rules\ContentUrl;
use App\Support\WebsiteContent;

class PageRequest extends StrictRequest
{
    public function rules(): array
    {
        $rules = [
            'status' => ['required', 'in:draft,published'],
            'seo' => ['required', 'array:title,meta_description,canonical_url,og_title,og_description,twitter_title,twitter_description,robots_index,robots_follow'],
            'seo.title' => ['required', 'string', 'max:180'],
            'seo.meta_description' => ['required', 'string', 'max:500'],
            'seo.canonical_url' => ['sometimes', 'nullable', 'string', 'max:2048', new ContentUrl],
            'seo.robots_index' => ['sometimes', 'boolean'],
            'seo.robots_follow' => ['sometimes', 'boolean'],
            'og_image_media_id' => ['sometimes', 'nullable', 'integer', 'exists:media,id'],
            'featured_entry_ids' => ['sometimes', 'array', 'max:30'],
            'featured_entry_ids.*' => ['required', 'integer', 'distinct', 'exists:portfolio_entries,id'],
        ];
        foreach (['og_title', 'twitter_title', 'og_description', 'twitter_description'] as $field) {
            $rules['seo.'.$field] = ['sometimes', 'nullable', 'string', str_ends_with($field, 'title') ? 'max:180' : 'max:500'];
        }

        return $rules + WebsiteContent::pageRules((string) $this->route('page_key'));
    }
}
