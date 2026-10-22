<?php

namespace Database\Factories;

use App\Models\Service;
use Illuminate\Database\Eloquent\Factories\Factory;

/** @extends Factory<Service> */
class ServiceFactory extends Factory
{
    protected $model = Service::class;

    public function definition(): array
    {
        return ['slug' => fake()->unique()->slug(2), 'title' => fake()->sentence(3), 'summary' => fake()->sentence(), 'description' => fake()->paragraph(), 'is_active' => false, 'sort_order' => 0];
    }
}
