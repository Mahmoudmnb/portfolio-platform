<?php

namespace App\Services;

use App\Models\PortfolioEntry;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\ValidationException;

class AnalyticsCounter
{
    public function increment(array $event): void
    {
        if (! config('portfolio.analytics_enabled')) {
            return;
        }
        DB::transaction(function () use ($event) {
            if ($event['event_name'] === 'entry_view' && ! PortfolioEntry::visible()->whereKey($event['entry_id'])->sharedLock()->first()) {
                throw ValidationException::withMessages(['entry_id' => ['A currently published entry is required.']]);
            }
            $day = now('UTC')->toDateString();
            $host = null;
            if (! empty($event['referrer'])) {
                $host = $this->host(parse_url($event['referrer'], PHP_URL_HOST));
            }
            $own = array_map(fn ($url) => $this->host(parse_url($url, PHP_URL_HOST) ?: $url), config('portfolio.site_origins'));
            if (in_array($host, $own, true)) {
                $host = null;
            }
            // Lock daily allocation, including the count+insert, so the ceiling holds under concurrency.
            DB::table('application_locks')->upsert([['name' => 'analytics:'.$day]], ['name'], ['name']);
            if ($host !== null) {
                $existing = DB::table('analytics_daily_counts')->where('date', $day)->where('referrer_host', $host)->exists();
                $count = DB::table('analytics_daily_counts')->where('date', $day)->whereNotNull('referrer_host')->where('referrer_host', '<>', 'other')->distinct()->count('referrer_host');
                if (! $existing && $count >= config('portfolio.referrer_daily_limit')) {
                    $host = 'other';
                }
            }
            $path = rtrim($event['path'], '/') ?: '/';
            $entry = isset($event['entry_id']) ? (int) $event['entry_id'] : null;
            $key = hash('sha256', json_encode([$day, $event['event_name'], $path, $entry, $host], JSON_THROW_ON_ERROR));
            DB::statement('INSERT INTO analytics_daily_counts (date,aggregate_key,event_name,path,entry_id,referrer_host,count,created_at,updated_at) VALUES (?,?,?,?,?,?,1,?,?) ON DUPLICATE KEY UPDATE count=analytics_daily_counts.count+1,updated_at=?', [$day, $key, $event['event_name'], $path, $entry, $host, now(), now(), now()]);
        }, 3);
    }

    private function host(string $host): string
    {
        return preg_replace('/^www\./', '', strtolower(rtrim($host, '.')));
    }
}
