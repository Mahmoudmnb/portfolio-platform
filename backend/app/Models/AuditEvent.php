<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AuditEvent extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    const UPDATED_AT = null;

    protected function casts(): array
    {
        return ['summary' => 'array', 'created_at' => 'immutable_datetime'];
    }
}
