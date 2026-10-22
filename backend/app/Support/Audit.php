<?php

namespace App\Support;

use App\Models\AuditEvent;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class Audit
{
    public static function record(string $action, Model $entity, array $fields = []): void
    {
        AuditEvent::create(['actor_id' => Auth::id(), 'action' => $action, 'entity_type' => $entity->getTable(), 'entity_id' => $entity->getKey(), 'summary' => ['fields' => array_values(array_diff($fields, ['password', 'email', 'message', 'internal_note']))]]);
    }
}
