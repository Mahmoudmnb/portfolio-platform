<?php

namespace App\Http\Resources;

use App\Models\AuditEvent;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

/** @mixin AuditEvent */
class AuditResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return ['id' => $this->id, 'actor_id' => $this->actor_id, 'action' => $this->action, 'entity_type' => $this->entity_type, 'entity_id' => $this->entity_id, 'summary' => $this->summary, 'created_at' => $this->created_at->toISOString()];
    }
}
