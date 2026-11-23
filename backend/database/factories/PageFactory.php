<?php

namespace Database\Factories;

use App\Models\Page;
use Illuminate\Database\Eloquent\Factories\Factory;

/** @extends Factory<Page> */
class PageFactory extends Factory
{
    public function definition(): array
    {
        return ['page_key' => 'home', 'status' => 'draft', 'content' => ['hero' => ['title' => 'Fictional studio']], 'seo' => ['title' => 'Fictional studio', 'meta_description' => 'Fictional page for integration testing.']];
    }
}
