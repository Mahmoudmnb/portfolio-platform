<?php

namespace App\Console\Commands;

use App\Models\Media;
use App\Services\MediaLifecycle;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;

class PruneData extends Command
{
    protected $signature = 'app:prune';

    protected $description = 'Prune expired private data, counters and unattached media.';

    public function handle(MediaLifecycle $lifecycle): int
    {
        foreach (['analytics_daily_counts' => ['date', 'analytics_retention_days'], 'inquiries' => ['submitted_at', 'inquiry_retention_days'], 'audit_events' => ['created_at', 'audit_retention_days']] as $table => [$column,$setting]) {
            $cutoff = now('UTC')->startOfDay()->subDays(max(1, (int) config('portfolio.'.$setting)) - 1);
            $count = DB::table($table)->where($column, '<', $cutoff)->delete();
            $this->info($table.': '.$count.' pruned');
            logger()->info('Retention pruned', ['entity_type' => $table, 'count' => $count]);
        }
        $count = 0;
        Media::where('created_at', '<', now()->subDay())->orderBy('id')->chunkById(100, function ($items) use ($lifecycle, &$count) {
            foreach ($items as $m) {
                if ($lifecycle->delete($m->id, true)) {
                    $count++;
                }
            }
        });
        $this->info('media: '.$count.' cleanup jobs queued');
        logger()->info('Media cleanup queued', ['count' => $count]);
        $this->call('sanctum:prune-expired', ['--hours' => 0]);

        return self::SUCCESS;
    }
}
