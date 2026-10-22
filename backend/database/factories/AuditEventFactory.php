<?php

namespace Database\Factories;

use App\Models\AuditEvent;
use Illuminate\Database\Eloquent\Factories\Factory;

/** @extends Factory<AuditEvent> */
class AuditEventFactory extends Factory
{
    protected $model = AuditEvent::class;

    public function definition(): array
    {
        return ['actor_id' => null, 'action' => 'updated', 'entity_type' => 'portfolio_entries', 'entity_id' => 1, 'summary' => ['fields' => ['title']], 'created_at' => now()];
    }
}
