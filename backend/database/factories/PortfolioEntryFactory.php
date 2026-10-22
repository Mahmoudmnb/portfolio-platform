<?php

namespace Database\Factories;

use App\Models\PortfolioEntry;
use Illuminate\Database\Eloquent\Factories\Factory;

/** @extends Factory<PortfolioEntry> */
class PortfolioEntryFactory extends Factory
{
    protected $model = PortfolioEntry::class;

    public function definition(): array
    {
        return ['kind' => 'project', 'slug' => fake()->unique()->slug(3), 'title' => fake()->sentence(4), 'summary' => fake()->sentence(), 'description' => fake()->paragraph(), 'status' => 'draft', 'featured' => false, 'sort_order' => 0];
    }
}
