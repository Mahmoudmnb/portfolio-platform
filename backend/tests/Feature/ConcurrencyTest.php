<?php

namespace Tests\Feature;

use App\Models\Media;
use App\Models\PortfolioEntry;
use App\Models\User;
use App\Services\AnalyticsCounter;
use App\Services\ContentWriter;
use App\Services\MediaLifecycle;
use Illuminate\Database\UniqueConstraintViolationException;
use Illuminate\Foundation\Testing\DatabaseMigrations;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Queue;
use Illuminate\Validation\ValidationException;
use Tests\TestCase;

class ConcurrencyTest extends TestCase
{
    use DatabaseMigrations;

    private function parallel(array $tasks): void
    {
        $this->assertTrue(function_exists('pcntl_fork'), 'MySQL/MariaDB race tests require pcntl.');
        DB::disconnect();
        $children = [];
        foreach ($tasks as $task) {
            $pid = pcntl_fork();
            $this->assertNotSame(-1, $pid);
            if ($pid === 0) {
                DB::purge();
                try {
                    $task();
                    DB::disconnect();
                    exit(0);
                } catch (\Throwable $e) {
                    fwrite(STDERR, get_class($e).': '.$e->getMessage()."\n");
                    exit(1);
                }
            }
            $children[] = $pid;
        }
        foreach ($children as $pid) {
            pcntl_waitpid($pid, $status);
            $this->assertSame(0, pcntl_wexitstatus($status));
        }
        DB::purge();
    }

    public function test_concurrent_null_bucket_increments_and_daily_host_cap(): void
    {
        config(['portfolio.referrer_daily_limit' => 2]);
        $tasks = [];
        for ($i = 0; $i < 6; $i++) {
            $tasks[] = function () use ($i) {
                for ($j = 0; $j < 10; $j++) {
                    app(AnalyticsCounter::class)->increment(['event_name' => 'page_view', 'path' => '/']);
                } app(AnalyticsCounter::class)->increment(['event_name' => 'page_view', 'path' => '/about', 'referrer' => 'https://host'.$i.'.test']);
            };
        }
        $this->parallel($tasks);
        $this->assertSame(60, (int) DB::table('analytics_daily_counts')->where('path', '/')->value('count'));
        $this->assertSame(2, DB::table('analytics_daily_counts')->whereNotNull('referrer_host')->where('referrer_host', '<>', 'other')->count());
        $this->assertSame(4, (int) DB::table('analytics_daily_counts')->where('referrer_host', 'other')->value('count'));
    }

    public function test_concurrent_generated_slugs_remain_unique(): void
    {
        $task = fn () => app(ContentWriter::class)->save('entries', ['kind' => 'project', 'title' => 'Concurrent entry', 'summary' => 'Example', 'description' => 'Example']);
        $this->parallel([$task, $task, $task]);
        $this->assertSame(3, PortfolioEntry::count());
        $this->assertSame(3, PortfolioEntry::distinct()->count('slug'));
    }

    public function test_concurrent_owner_inserts_cannot_bypass_the_singleton_constraint(): void
    {
        $task = function () {
            try {
                User::factory()->create(['email' => 'owner-'.getmypid().'@example.test']);
            } catch (UniqueConstraintViolationException $expected) {
            }
        };
        $this->parallel([$task, $task, $task]);
        $this->assertSame(1, User::count());
    }

    public function test_concurrent_explicit_slug_collision_is_a_validation_error(): void
    {
        $task = function () {
            try {
                app(ContentWriter::class)->save('entries', ['kind' => 'project', 'slug' => 'explicit-race', 'title' => 'Concurrent entry', 'summary' => 'Example', 'description' => 'Example']);
            } catch (ValidationException $expected) {
            }
        };
        $this->parallel([$task, $task, $task]);
        $this->assertSame(1, PortfolioEntry::count());
    }

    public function test_attach_versus_delete_and_cleanup_preserves_integrity(): void
    {
        Queue::fake();
        User::factory()->create();
        $m = Media::factory()->create(['created_at' => now()->subDays(2)]);
        $id = $m->id;
        $attach = function () use ($id) {
            try {
                app(ContentWriter::class)->save('entries', ['kind' => 'project', 'title' => 'Race', 'summary' => 'Example', 'description' => 'Example', 'cover_media_id' => $id]);
            } catch (ValidationException $expected) {
            }
        };
        $remove = fn () => app(MediaLifecycle::class)->delete($id, true);
        $this->parallel([$attach, $remove]);
        $media = Media::findOrFail($id);
        $entry = PortfolioEntry::first();
        if ($entry) {
            $this->assertSame('ready', $media->status);
            $this->assertSame($id, $entry->cover_media_id);
        } else {
            $this->assertSame('deleting', $media->status);
        }
    }
}
