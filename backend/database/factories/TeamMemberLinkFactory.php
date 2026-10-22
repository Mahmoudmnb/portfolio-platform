<?php

namespace Database\Factories;

use App\Models\TeamMember;
use App\Models\TeamMemberLink;
use Illuminate\Database\Eloquent\Factories\Factory;

/** @extends Factory<TeamMemberLink> */
class TeamMemberLinkFactory extends Factory
{
    protected $model = TeamMemberLink::class;

    public function definition(): array
    {
        return ['team_member_id' => TeamMember::factory(), 'label' => 'Website', 'url' => 'https://example.test', 'sort_order' => 0];
    }
}
