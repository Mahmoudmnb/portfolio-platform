<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

/**
 * @property array<string, mixed> $content
 * @property array<string, mixed> $seo
 */
class Page extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    protected function casts(): array
    {
        return ['content' => 'array', 'seo' => 'array'];
    }

    /** @return BelongsTo<Media, $this> */
    public function ogImage(): BelongsTo
    {
        return $this->belongsTo(Media::class, 'og_image_media_id');
    }

    /** @return BelongsToMany<PortfolioEntry, $this> */
    public function featuredEntries(): BelongsToMany
    {
        return $this->belongsToMany(PortfolioEntry::class, 'page_entry', 'page_id', 'entry_id')->withPivot('sort_order')->orderByPivot('sort_order')->orderBy('portfolio_entries.id');
    }
}
