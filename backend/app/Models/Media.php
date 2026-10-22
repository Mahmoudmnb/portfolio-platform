<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\Pivot;

/**
 * @property-read int|null $gallery_entries_count
 * @property-read int|null $cover_entries_count
 * @property-read int|null $members_count
 * @property-read int|null $settings_count
 * @property-read Pivot $pivot
 */
class Media extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    protected $table = 'media';

    protected function casts(): array
    {
        return ['bytes' => 'integer', 'width' => 'integer', 'height' => 'integer'];
    }

    public function galleryEntries(): BelongsToMany
    {
        return $this->belongsToMany(PortfolioEntry::class, 'entry_media', 'media_id', 'entry_id');
    }

    public function coverEntries(): HasMany
    {
        return $this->hasMany(PortfolioEntry::class, 'cover_media_id');
    }

    public function members(): HasMany
    {
        return $this->hasMany(TeamMember::class, 'photo_media_id');
    }

    public function settings(): HasMany
    {
        return $this->hasMany(SiteSetting::class, 'logo_media_id');
    }

    public function scopeWithUsage(Builder $q): Builder
    {
        return $q->withCount(['galleryEntries', 'coverEntries', 'members', 'settings']);
    }

    public function usageCount(): int
    {
        return $this->galleryEntries()->count() + $this->coverEntries()->count() + $this->members()->count() + $this->settings()->count();
    }

    public function variantKey(string $variant = 'display'): string
    {
        return $this->storage_key.'/'.$variant.'.webp';
    }
}
