<?php

namespace Tests\Feature;

use App\Services\PostgresTransfer;
use Illuminate\Database\QueryException;
use Illuminate\Foundation\Testing\DatabaseMigrations;
use Illuminate\Support\Facades\DB;
use Tests\TestCase;

class PostgresTransferTest extends TestCase
{
    use DatabaseMigrations;

    public function test_copy_preserves_ids_json_utc_nulls_password_hashes_and_auto_increment(): void
    {
        if (! getenv('TRANSFER_TEST_SOURCE')) {
            $this->markTestSkipped('Set TRANSFER_TEST_SOURCE=1 with an isolated legacy_pgsql *_testing database.');
        }
        $source = DB::connection('legacy_pgsql');
        $this->assertStringEndsWith('_testing', $source->getDatabaseName());
        // Only this explicitly disposable source is prepared by the test.
        foreach (array_reverse(PostgresTransfer::TABLES) as $table) {
            $source->table($table)->delete();
        }
        $source->statement('ALTER TABLE users ALTER COLUMN created_at TYPE TIMESTAMP(6) WITH TIME ZONE');
        $password = password_hash('Fictional-transfer-123', PASSWORD_BCRYPT);
        $source->table('users')->insert(['id' => 7, 'name' => 'Fictional Owner', 'email' => 'transfer@example.test', 'password' => $password, 'enabled' => true, 'created_at' => '2026-10-21 20:30:00.123456+02']);
        $source->table('media')->insert(['id' => 9, 'storage_key' => 'fictional-transfer', 'disk' => 'public', 'original_filename' => 'example.png', 'mime_type' => 'image/png', 'bytes' => 200, 'width' => 2, 'height' => 2, 'status' => 'ready', 'uploader_id' => 7]);
        $source->table('portfolio_entries')->insert(['id' => 12, 'kind' => 'project', 'slug' => 'transfer-project', 'title' => 'Unicode 😀', 'summary' => 'Fictional summary', 'description' => 'Body', 'status' => 'published', 'published_at' => '2026-10-21 20:30:00+02', 'cover_media_id' => 9]);
        $source->table('entry_media')->insert(['entry_id' => 12, 'media_id' => 9, 'alt_text' => 'Example', 'sort_order' => 0]);
        $source->table('audit_events')->insert(['id' => 4, 'actor_id' => 7, 'action' => 'updated', 'entity_type' => 'entries', 'entity_id' => 12, 'summary' => '{"fields":["title"],"entity":"entry"}', 'created_at' => '2026-10-21 18:30:00+00']);
        $source->table('analytics_daily_counts')->insert(['id' => 15, 'date' => '2026-10-21', 'aggregate_key' => str_repeat('a', 64), 'event_name' => 'page_view', 'path' => '/', 'entry_id' => null, 'referrer_host' => null, 'count' => 17]);
        $transfer = app(PostgresTransfer::class);
        $dry = $transfer->run($source);
        $this->assertSame(1, $dry['users']['rows']);
        $this->assertDatabaseCount('users', 0);
        $copied = $transfer->run($source, apply: true);
        $this->assertCount(count(PostgresTransfer::TABLES), $copied);
        foreach ($copied as $report) {
            $this->assertTrue($report['reconciled']);
        }
        $this->assertSame($password, DB::table('users')->value('password'));
        $this->assertSame('2026-10-21 18:30:00.123456', DB::table('users')->value('created_at'));
        $this->assertDatabaseHas('portfolio_entries', ['id' => 12, 'cover_media_id' => 9, 'title' => 'Unicode 😀']);
        $this->assertDatabaseHas('analytics_daily_counts', ['entry_id' => null, 'referrer_host' => null, 'count' => 17]);
        $this->assertSame($copied, $transfer->run($source, verify: true));
        DB::table('analytics_daily_counts')->where('id', 15)->increment('count');
        try {
            $transfer->run($source, verify: true);
            $this->fail('Changed counters must fail reconciliation.');
        } catch (\RuntimeException $error) {
            $this->assertStringContainsString('Reconciliation failed', $error->getMessage());
        }
        $id = DB::table('portfolio_entries')->insertGetId(['kind' => 'project', 'slug' => 'next-project', 'title' => 'Next', 'summary' => 'Example', 'description' => 'Example']);
        $this->assertGreaterThan(12, $id);
        $this->expectException(\RuntimeException::class);
        $transfer->run($source, apply: true);
    }

    public function test_invalid_legacy_record_rolls_back_all_copied_target_rows(): void
    {
        if (! getenv('TRANSFER_TEST_SOURCE')) {
            $this->markTestSkipped('Requires an isolated PostgreSQL transfer source.');
        }
        $source = DB::connection('legacy_pgsql');
        $this->assertStringEndsWith('_testing', $source->getDatabaseName());
        foreach (array_reverse(PostgresTransfer::TABLES) as $table) {
            $source->table($table)->delete();
        }
        $source->table('users')->insert(['id' => 7, 'name' => 'Rollback Owner', 'email' => 'rollback@example.test', 'password' => password_hash('Fictional-rollback-123', PASSWORD_BCRYPT), 'enabled' => true]);
        // PostgreSQL bigint IDs can be negative; MySQL unsigned IDs must refuse them.
        $source->table('analytics_daily_counts')->insert(['id' => -1, 'date' => '2026-10-21', 'aggregate_key' => str_repeat('b', 64), 'event_name' => 'page_view', 'path' => '/about', 'count' => 1]);
        try {
            app(PostgresTransfer::class)->run($source, apply: true);
            $this->fail('An out-of-domain legacy ID must fail the entire import.');
        } catch (QueryException $expected) {
            $this->assertDatabaseCount('users', 0);
            $this->assertDatabaseCount('media', 0);
            $this->assertDatabaseCount('portfolio_entries', 0);
            $this->assertDatabaseCount('analytics_daily_counts', 0);
        } finally {
            $source->table('analytics_daily_counts')->where('id', -1)->delete();
        }
    }
}
