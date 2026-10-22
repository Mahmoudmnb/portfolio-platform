<?php

namespace App\Models;

use Carbon\CarbonImmutable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * @property CarbonImmutable $submitted_at
 * @property CarbonImmutable|null $last_status_changed_at
 */
class Inquiry extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    protected function casts(): array
    {
        return ['submitted_at' => 'immutable_datetime', 'last_status_changed_at' => 'immutable_datetime'];
    }
}
