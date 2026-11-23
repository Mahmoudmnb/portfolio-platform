<?php

namespace App\Support;

use App\Rules\ContentLink;

class WebsiteContent
{
    public const PAGE_KEYS = ['home', 'about', 'services', 'projects', 'contact'];

    public const PROJECT_TYPES = ['mobile_app', 'web_app', 'desktop_app', 'platform'];

    public const PLATFORMS = ['android', 'ios', 'web', 'windows', 'macos', 'linux'];

    public const SECTIONS = [
        'home' => ['hero', 'highlights', 'service_cards', 'value_propositions', 'process_steps', 'metrics', 'cta'],
        'about' => ['intro', 'highlights', 'principles', 'journey_phases', 'philosophy_items', 'specializations', 'cta'],
        'services' => ['intro', 'highlights', 'capabilities', 'solutions', 'delivery_steps', 'cta'],
        'projects' => ['intro', 'highlights', 'delivery_steps', 'cta'],
        'contact' => ['intro', 'form', 'cta'],
    ];

    /** @return array<string, array<int, mixed>> */
    public static function ctaRules(string $prefix): array
    {
        return [
            $prefix => ['sometimes', 'nullable', 'array:eyebrow,title,description,button_label,button_url', 'min:1'],
            "$prefix.eyebrow" => ['sometimes', 'nullable', 'string', 'max:180'],
            "$prefix.title" => ['required_with:'.$prefix, 'string', 'max:500'],
            "$prefix.description" => ['sometimes', 'nullable', 'string', 'max:5000'],
            "$prefix.button_label" => ['required_with:'.$prefix, 'string', 'max:80'],
            "$prefix.button_url" => ['required_with:'.$prefix, 'string', 'max:2048', new ContentLink],
        ];
    }

    /** @return array<string, array<int, mixed>> */
    public static function linkRules(string $prefix): array
    {
        return [
            $prefix => ['sometimes', 'array', 'max:20'],
            "$prefix.*" => ['array:label,url,sort_order,is_visible,open_in_new_tab'],
            "$prefix.*.label" => ['required', 'string', 'max:80'],
            "$prefix.*.url" => ['required', 'string', 'max:2048', new ContentLink],
            "$prefix.*.sort_order" => ['sometimes', 'integer', 'between:-1000000,1000000'],
            "$prefix.*.is_visible" => ['sometimes', 'boolean'],
            "$prefix.*.open_in_new_tab" => ['sometimes', 'boolean'],
        ];
    }

    /** @return array<string, array<int, mixed>> */
    public static function pageRules(string $pageKey): array
    {
        $sections = self::SECTIONS[$pageKey] ?? [];
        $rules = ['content' => ['required', 'array:'.implode(',', $sections)]];
        foreach ($sections as $section) {
            $prefix = 'content.'.$section;
            if ($section === 'cta') {
                $rules += self::ctaRules($prefix);
            } elseif (in_array($section, ['hero', 'intro'], true)) {
                $rules += [
                    $prefix => ['required', 'array:eyebrow,title,highlighted_text,description,primary_cta,secondary_cta'],
                    "$prefix.title" => ['required', 'string', 'max:500'],
                    "$prefix.eyebrow" => ['sometimes', 'nullable', 'string', 'max:180'],
                    "$prefix.highlighted_text" => ['sometimes', 'nullable', 'string', 'max:500'],
                    "$prefix.description" => ['sometimes', 'nullable', 'string', 'max:5000'],
                ];
                foreach (['primary_cta', 'secondary_cta'] as $cta) {
                    $rules += [
                        "$prefix.$cta" => ['sometimes', 'nullable', 'array:label,url', 'min:1'],
                        "$prefix.$cta.label" => ['required_with:'.$prefix.'.'.$cta, 'string', 'max:80'],
                        "$prefix.$cta.url" => ['required_with:'.$prefix.'.'.$cta, 'string', 'max:2048', new ContentLink],
                    ];
                }
            } elseif ($section === 'form') {
                $fields = ['name_label', 'email_label', 'subject_label', 'message_label', 'submit_label', 'sending_label', 'success_message', 'error_message', 'confidentiality_note'];
                $rules[$prefix] = ['sometimes', 'array:'.implode(',', [...$fields, 'subject_options'])];
                foreach ($fields as $field) {
                    $rules["$prefix.$field"] = ['sometimes', 'nullable', 'string', 'max:1000'];
                }
                $rules["$prefix.subject_options"] = ['sometimes', 'array', 'max:20'];
                $rules["$prefix.subject_options.*"] = ['required', 'string', 'max:180'];
            } else {
                $rules += [
                    $prefix => ['sometimes', 'array', 'max:30'],
                    "$prefix.*" => ['array:title,description,icon_key,label,value,period,url,sort_order,is_visible'],
                    "$prefix.*.title" => ['required', 'string', 'max:180'],
                    "$prefix.*.description" => ['sometimes', 'nullable', 'string', 'max:5000'],
                    "$prefix.*.icon_key" => ['sometimes', 'nullable', 'string', 'max:80', 'regex:/^[a-z][a-z0-9_-]*$/'],
                    "$prefix.*.label" => ['sometimes', 'nullable', 'string', 'max:180'],
                    "$prefix.*.value" => ['sometimes', 'nullable', 'string', 'max:180'],
                    "$prefix.*.period" => ['sometimes', 'nullable', 'string', 'max:180'],
                    "$prefix.*.url" => ['sometimes', 'nullable', 'string', 'max:2048', new ContentLink],
                    "$prefix.*.sort_order" => ['sometimes', 'integer', 'between:-1000000,1000000'],
                    "$prefix.*.is_visible" => ['sometimes', 'boolean'],
                ];
            }
        }

        $headings = array_values(array_diff($sections, ['hero', 'intro', 'form', 'cta']));
        $headings = [...$headings, 'featured_projects', 'team_members', 'services'];
        $rules['content'][1] .= ',section_headings';
        $rules['content.section_headings'] = ['sometimes', 'array:'.implode(',', array_unique($headings))];
        foreach (array_unique($headings) as $heading) {
            $prefix = 'content.section_headings.'.$heading;
            $rules[$prefix] = ['sometimes', 'array:eyebrow,title,description', 'min:1'];
            $rules[$prefix.'.eyebrow'] = ['sometimes', 'nullable', 'string', 'max:180'];
            $rules[$prefix.'.title'] = ['required_with:'.$prefix, 'string', 'max:500'];
            $rules[$prefix.'.description'] = ['sometimes', 'nullable', 'string', 'max:5000'];
        }

        return $rules;
    }

    /** @param array<int, array<string, mixed>> $items
     * @return array<int, array<string, mixed>>
     */
    public static function ordered(array $items, bool $admin): array
    {
        return collect($items)->filter(fn ($item) => $admin || ($item['is_visible'] ?? true))
            ->sortBy('sort_order', SORT_REGULAR)->values()->map(function (array $item): array {
                if (array_key_exists('sort_order', $item)) {
                    $item['sort_order'] = (int) $item['sort_order'];
                }
                foreach (['is_visible', 'open_in_new_tab'] as $flag) {
                    if (array_key_exists($flag, $item)) {
                        $item[$flag] = (bool) $item[$flag];
                    }
                }

                return $item;
            })->all();
    }
}
