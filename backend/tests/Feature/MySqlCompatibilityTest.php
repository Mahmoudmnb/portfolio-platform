<?php

namespace Tests\Feature;

use App\Models\Media;
use App\Models\PortfolioEntry;
use App\Models\User;
use App\Services\ContentWriter;
use Illuminate\Database\QueryException;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Facades\DB;
use Tests\TestCase;

class MySqlCompatibilityTest extends TestCase
{
    use RefreshDatabase;

    public function test_connection_uses_strict_innodb_utc_and_read_committed(): void
    {
        $session = DB::selectOne('SELECT @@session.time_zone AS zone, @@session.sql_mode AS mode, @@collation_connection AS collation');
        $this->assertSame('+00:00', $session->zone);
        $this->assertStringContainsString('STRICT_TRANS_TABLES', $session->mode);
        $this->assertSame('utf8mb4_bin', $session->collation);
        $variable = str_contains(DB::selectOne('SELECT VERSION() AS version')->version, 'MariaDB') ? '@@tx_isolation' : '@@transaction_isolation';
        $this->assertSame('READ-COMMITTED', DB::selectOne('SELECT '.$variable.' AS isolation_level')->isolation_level);
        $this->assertSame('InnoDB', DB::selectOne("SELECT ENGINE FROM information_schema.TABLES WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'users'")->ENGINE);
    }

    public function test_database_rejects_second_owner_even_with_a_different_email(): void
    {
        User::factory()->create();
        $this->expectException(QueryException::class);
        User::factory()->create(['email' => 'second@example.test']);
    }

    public function test_database_rejects_unnormalized_owner_email(): void
    {
        $this->expectException(QueryException::class);
        DB::table('users')->insert(['name' => 'Owner', 'email' => 'OWNER@example.test', 'password' => 'unused', 'enabled' => true]);
    }

    public function test_search_ignores_case_but_preserves_accents_and_literal_metacharacters(): void
    {
        User::factory()->create();
        $media = Media::factory()->create();
        PortfolioEntry::factory()->create(['title' => 'CAFÉ 100%_!\\notes', 'summary' => 'Unrelated', 'status' => 'published', 'published_at' => now(), 'cover_media_id' => $media->id]);
        foreach (['café', '%_!\\'] as $query) {
            $this->getJson('/api/v1/entries?'.http_build_query(['q' => $query]))->assertOk()->assertJsonPath('meta.total', 1);
        }
        $this->getJson('/api/v1/entries?q=cafe')->assertOk()->assertJsonPath('meta.total', 0);
        $this->getJson('/api/v1/entries/CAFÉ')->assertNotFound();
    }

    public function test_long_multibyte_descriptions_are_not_truncated_and_future_dates_survive_2038(): void
    {
        $description = str_repeat('😀', 50000);
        $entry = app(ContentWriter::class)->save('entries', ['kind' => 'project', 'title' => 'Unicode', 'summary' => 'Example', 'description' => $description, 'published_at' => '2040-01-01T00:00:00Z']);
        $this->assertSame($description, $entry->description);
        $this->assertSame('2040-01-01', $entry->published_at->toDateString());
    }

    public function test_foreign_key_conflicts_keep_the_api_conflict_envelope(): void
    {
        $user = User::factory()->create();
        $media = Media::factory()->create();
        PortfolioEntry::factory()->create(['cover_media_id' => $media->id]);
        $this->withToken($user->createToken('test')->plainTextToken);
        $this->deleteJson('/api/v1/admin/media/'.$media->id)->assertConflict()->assertJsonPath('code', 'CONFLICT');
    }
}
