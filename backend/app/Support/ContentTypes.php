<?php

namespace App\Support;

use App\Models\Category;
use App\Models\PortfolioEntry;
use App\Models\Service;
use App\Models\SiteSetting;
use App\Models\TeamMember;
use App\Models\Technology;
use Illuminate\Database\Eloquent\Builder;

class ContentTypes
{
    public const MODELS = ['entries' => PortfolioEntry::class, 'categories' => Category::class, 'technologies' => Technology::class, 'team-members' => TeamMember::class, 'services' => Service::class, 'site-settings' => SiteSetting::class];

    public const MEDIA_USAGE = ['galleryEntries', 'coverEntries', 'members', 'settings', 'lightSettings', 'darkSettings', 'faviconSettings', 'serviceCovers', 'pageImages'];

    public static function query(string $type, bool $admin = false): Builder
    {
        $image = fn ($query) => $query->withCount(self::MEDIA_USAGE);

        return match ($type) {
            'entries' => PortfolioEntry::with(['category', 'cover' => $image, 'technologies', 'gallery' => $image, 'contributors' => fn ($query) => $query->when(! $admin, fn ($query) => $query->where('is_active', true))->with(['photo' => $image, 'links'])])->when(! $admin, fn ($query) => $query->visible()),
            'categories' => Category::query()->when(! $admin, fn ($query) => $query->whereHas('entries', fn ($entries) => $entries->visible())),
            'technologies' => Technology::query()->when(! $admin, fn ($query) => $query->whereHas('entries', fn ($entries) => $entries->visible())),
            'team-members' => TeamMember::with(['photo' => $image, 'links'])->when(! $admin, fn ($query) => $query->where('is_active', true)),
            'services' => Service::with(['cover' => $image])->when(! $admin, fn ($query) => $query->where('is_active', true)),
            'site-settings' => SiteSetting::with(['logo' => $image, 'logoLight' => $image, 'logoDark' => $image, 'favicon' => $image]),
            default => throw new \LogicException('Unsupported content type')
        };
    }
}
