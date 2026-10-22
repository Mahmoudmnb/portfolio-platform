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

    private const USAGE = ['galleryEntries', 'coverEntries', 'members', 'settings'];

    public static function query(string $type, bool $admin = false): Builder
    {
        $image = fn ($query) => $query->withCount(self::USAGE);

        return match ($type) {
            'entries' => PortfolioEntry::with(['category', 'cover' => $image, 'technologies', 'gallery' => $image, 'contributors' => fn ($query) => $query->when(! $admin, fn ($query) => $query->where('is_active', true))->with(['photo' => $image, 'links'])])->when(! $admin, fn ($query) => $query->visible()),
            'categories' => Category::query()->when(! $admin, fn ($query) => $query->whereHas('entries', fn ($entries) => $entries->visible())),
            'technologies' => Technology::query()->when(! $admin, fn ($query) => $query->whereHas('entries', fn ($entries) => $entries->visible())),
            'team-members' => TeamMember::with(['photo' => $image, 'links'])->when(! $admin, fn ($query) => $query->where('is_active', true)),
            'services' => Service::query()->when(! $admin, fn ($query) => $query->where('is_active', true)),
            'site-settings' => SiteSetting::with(['logo' => $image]),
            default => throw new \LogicException('Unsupported content type')
        };
    }
}
