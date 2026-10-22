<?php

namespace Database\Factories;

use App\Models\AnalyticsDailyCount;
use Illuminate\Database\Eloquent\Factories\Factory;

/** @extends Factory<AnalyticsDailyCount> */
class AnalyticsDailyCountFactory extends Factory
{
    protected $model = AnalyticsDailyCount::class;

    public function definition(): array
    {
        return ['date' => now()->toDateString(), 'aggregate_key' => hash('sha256', fake()->uuid()), 'event_name' => 'page_view', 'path' => '/', 'count' => 1];
    }
}
