<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Technology extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    protected function casts(): array
    {
        return [];
    }

    /** @return BelongsToMany<PortfolioEntry, $this> */
    public function entries(): BelongsToMany
    {
        return $this->belongsToMany(PortfolioEntry::class, 'entry_technology', 'technology_id', 'entry_id');
    }
}
