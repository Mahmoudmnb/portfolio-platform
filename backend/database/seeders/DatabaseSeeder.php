<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('site_settings')->insertOrIgnore(['id' => 1, 'site_title' => 'Portfolio', 'tagline' => 'Software and creative engineering', 'introduction' => 'Welcome to our portfolio.', 'contact_email' => 'contact@example.test', 'availability' => 'available', 'default_seo_title' => 'Portfolio', 'default_seo_description' => 'Projects, products and services.', 'social_links' => '[]', 'created_at' => now(), 'updated_at' => now()]);
    }
}
