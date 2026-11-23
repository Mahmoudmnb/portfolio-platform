<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

/**
 * @property array<int, array<string, mixed>> $social_links
 * @property array<int, array<string, mixed>>|null $navigation
 * @property array<string, mixed>|null $footer
 * @property array<string, mixed>|null $shared_cta
 * @property array<string, mixed>|null $legal_links
 * @property string|null $phone
 * @property string|null $location
 * @property string|null $availability_text
 * @property int|null $logo_light_media_id
 * @property int|null $logo_dark_media_id
 * @property int|null $favicon_media_id
 */
class SiteSetting extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    protected function casts(): array
    {
        return ['social_links' => 'array', 'navigation' => 'array', 'footer' => 'array', 'shared_cta' => 'array', 'legal_links' => 'array'];
    }

    /** @return BelongsTo<Media, $this> */
    public function logo(): BelongsTo
    {
        return $this->belongsTo(Media::class, 'logo_media_id');
    }

    /** @return BelongsTo<Media, $this> */
    public function logoLight(): BelongsTo
    {
        return $this->belongsTo(Media::class, 'logo_light_media_id');
    }

    /** @return BelongsTo<Media, $this> */
    public function logoDark(): BelongsTo
    {
        return $this->belongsTo(Media::class, 'logo_dark_media_id');
    }

    /** @return BelongsTo<Media, $this> */
    public function favicon(): BelongsTo
    {
        return $this->belongsTo(Media::class, 'favicon_media_id');
    }
}
