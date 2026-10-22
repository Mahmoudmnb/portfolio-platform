<?php

namespace App\Models;

use Carbon\CarbonImmutable;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

/**
 * @property string|null $repository_url
 * @property string|null $demo_url
 * @property string|null $external_url
 * @property CarbonImmutable|null $published_at
 */
class PortfolioEntry extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    protected $table = 'portfolio_entries';

    protected function casts(): array
    {
        return ['featured' => 'boolean', 'sort_order' => 'integer', 'published_at' => 'immutable_datetime'];
    }

    public function scopeVisible(Builder $query): Builder
    {
        return $query->where('status', 'published')->where('published_at', '<=', now());
    }

    /** @return BelongsTo<Category, $this> */
    public function category(): BelongsTo
    {
        return $this->belongsTo(Category::class);
    }

    /** @return BelongsTo<Media, $this> */
    public function cover(): BelongsTo
    {
        return $this->belongsTo(Media::class, 'cover_media_id');
    }

    /** @return BelongsToMany<Technology, $this> */
    public function technologies(): BelongsToMany
    {
        return $this->belongsToMany(Technology::class, 'entry_technology', 'entry_id')->orderBy('technologies.id');
    }

    /** @return BelongsToMany<TeamMember, $this> */
    public function contributors(): BelongsToMany
    {
        return $this->belongsToMany(TeamMember::class, 'entry_contributor', 'entry_id')->orderBy('team_members.sort_order')->orderBy('team_members.id');
    }

    /** @return BelongsToMany<Media, $this> */
    public function gallery(): BelongsToMany
    {
        return $this->belongsToMany(Media::class, 'entry_media', 'entry_id')->withPivot('alt_text', 'sort_order')->orderByPivot('sort_order')->orderBy('media.id');
    }
}
