<?php

namespace Database\Factories;

use App\Models\TeamMember;
use Illuminate\Database\Eloquent\Factories\Factory;

/** @extends Factory<TeamMember> */
class TeamMemberFactory extends Factory
{
    protected $model = TeamMember::class;

    public function definition(): array
    {
        return ['slug' => fake()->unique()->slug(2), 'name' => fake()->name(), 'role_title' => 'Developer', 'bio' => 'Fictional team profile.', 'is_active' => false, 'sort_order' => 0];
    }
}
