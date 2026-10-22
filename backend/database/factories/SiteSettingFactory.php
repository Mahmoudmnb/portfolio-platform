<?php

namespace Database\Factories;

use App\Models\SiteSetting;
use Illuminate\Database\Eloquent\Factories\Factory;

/** @extends Factory<SiteSetting> */
class SiteSettingFactory extends Factory
{
    protected $model = SiteSetting::class;

    public function definition(): array
    {
        return ['site_title' => 'Portfolio', 'tagline' => 'Example', 'introduction' => 'Fictional introduction', 'contact_email' => 'contact@example.test', 'availability' => 'available', 'default_seo_title' => 'Portfolio', 'default_seo_description' => 'Example description', 'social_links' => []];
    }
}
