<?php

namespace Tests\Feature;

use App\Jobs\DeleteMedia;
use App\Jobs\ProcessMedia;
use App\Models\AnalyticsDailyCount;
use App\Models\AuditEvent;
use App\Models\Inquiry;
use App\Models\Media;
use App\Models\PortfolioEntry;
use App\Models\SiteSetting;
use App\Models\TeamMember;
use App\Models\User;
use App\Services\ImageInspector;
use Carbon\CarbonImmutable;
use Database\Seeders\DatabaseSeeder;
use Illuminate\Filesystem\FilesystemAdapter;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Queue;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Storage;
use Illuminate\Validation\ValidationException;
use Tests\TestCase;

class FailureTest extends TestCase
{
    use RefreshDatabase;

    private function owner(): User
    {
        $u = User::factory()->create();
        $this->withToken($u->createToken('test')->plainTextToken);

        return $u;
    }

    public function test_internal_failures_and_readiness_are_generic(): void
    {
        Route::get('/api/v1/internal-test', fn () => throw new \RuntimeException('SECRET_DIAGNOSTIC'));
        $r = $this->getJson('/api/v1/internal-test')->assertStatus(500)->assertJsonPath('code', 'INTERNAL_ERROR');
        $this->assertStringNotContainsString('SECRET_DIAGNOSTIC', $r->getContent());
        DB::shouldReceive('select')->once()->andThrow(new \RuntimeException('database credentials'));
        $this->getJson('/api/v1/ready')->assertStatus(503)->assertJsonPath('code', 'UNAVAILABLE');
    }

    public function test_oversized_body_maps_to_413(): void
    {
        $this->call('POST', '/api/v1/inquiries', [], [], [], ['CONTENT_LENGTH' => 100000000, 'CONTENT_TYPE' => 'application/json'], '{}')->assertStatus(413)->assertJsonPath('code', 'PAYLOAD_TOO_LARGE');
    }

    public function test_all_media_reference_locations_block_deletion(): void
    {
        $this->owner();
        $m = Media::factory()->create();
        $entry = PortfolioEntry::factory()->create();
        $entry->gallery()->attach($m, ['alt_text' => 'Example', 'sort_order' => 0]);
        $this->deleteJson('/api/v1/admin/media/'.$m->id)->assertConflict();
        $entry->gallery()->detach();
        $member = TeamMember::factory()->create(['photo_media_id' => $m->id]);
        $this->deleteJson('/api/v1/admin/media/'.$m->id)->assertConflict();
        $member->delete();
        $this->seed(DatabaseSeeder::class);
        SiteSetting::find(1)->update(['logo_media_id' => $m->id]);
        $this->deleteJson('/api/v1/admin/media/'.$m->id)->assertConflict();
        $this->getJson('/api/v1/admin/media?usage=used')->assertOk()->assertJsonPath('data.0.usage_count', 1);
    }

    public function test_processing_retry_and_exif_metadata_removal(): void
    {
        $this->owner();
        Storage::fake('local');
        Storage::fake('public');
        Queue::fake();
        $image = imagecreatetruecolor(30, 20);
        ob_start();
        imagejpeg($image);
        $jpeg = ob_get_clean();
        imagedestroy($image);
        $metadata = "Exif\0\0GPS_PRIVATE_METADATA";
        $jpeg = substr($jpeg, 0, 2)."\xff\xe1".pack('n', strlen($metadata) + 2).$metadata.substr($jpeg, 2);
        $r = $this->postJson('/api/v1/admin/media', ['file' => UploadedFile::fake()->createWithContent('gps.jpg', $jpeg)])->assertCreated();
        $m = Media::find($r->json('data.id'));
        $job = new ProcessMedia($m->id);
        $inspector = new ImageInspector;
        // A missing private input fails safely; restoring it lets the bounded retry succeed.
        $local = Storage::disk('local');
        $input = 'uploads/'.$m->storage_key;
        $original = $local->get($input);
        $local->delete($input);
        try {
            $job->handle($inspector);
            $this->fail('Missing input must fail.');
        } catch (ValidationException $expected) {
        }
        $this->assertSame('processing', $m->fresh()->status);
        $local->put($input, $original);
        $job->handle($inspector);
        $encoded = Storage::disk('public')->get($m->variantKey());
        $this->assertStringNotContainsString('GPS_PRIVATE_METADATA', $encoded);
        $this->assertStringNotContainsString('Exif', $encoded);
    }

    public function test_analytics_reject_control_characters_double_slashes_and_wrong_combinations(): void
    {
        foreach (['//', "/about\n", "/about\x00", '/about?email=private@example.test', 'https://example.test'] as $path) {
            $this->postJson('/api/v1/analytics/events', ['event_name' => 'page_view', 'path' => $path])->assertUnprocessable();
        }
        $this->postJson('/api/v1/analytics/events', ['event_name' => 'entry_view', 'path' => '/entries/missing'])->assertUnprocessable();
    }

    public function test_logout_all_revokes_other_devices_and_own_host_is_not_persisted(): void
    {
        $u = $this->owner();
        $other = $u->createToken('second')->plainTextToken;
        $this->postJson('/api/v1/admin/auth/logout-all')->assertNoContent();
        $this->withToken($other)->getJson('/api/v1/admin/auth/me')->assertUnauthorized();
        $this->postJson('/api/v1/analytics/events', ['event_name' => 'page_view', 'path' => '/', 'referrer' => 'http://localhost:8080/private?secret=1'])->assertAccepted();
        $this->assertDatabaseHas('analytics_daily_counts', ['referrer_host' => null]);
    }

    public function test_malformed_dimensions_and_login_types_are_validation_errors(): void
    {
        $this->postJson('/api/v1/admin/auth/login', ['email' => ['invalid'], 'password' => 'wrong', 'device_name' => 'Example'])->assertUnprocessable();
        $this->postJson('/api/v1/analytics/events', ['event_name' => 'entry_view', 'path' => '/entries/example', 'entry_id' => [1, []]])->assertUnprocessable();
        $this->owner();
        $this->postJson('/api/v1/admin/entries', ['kind' => 'project', 'title' => 'Example', 'summary' => 'Example', 'description' => 'Example', 'gallery' => [['media_id' => 999, 'alt_text' => 'Example', 'unexpected' => 'bad']]])->assertUnprocessable();
    }

    public function test_storage_delete_failure_retains_durable_state_for_retry(): void
    {
        $this->owner();
        $local = Storage::fake('local');
        $media = Media::factory()->create(['status' => 'deleting']);
        $disk = \Mockery::mock(FilesystemAdapter::class);
        $disk->shouldReceive('exists')->andReturn(true);
        $disk->shouldReceive('delete')->andReturn(false, true, true);
        Storage::shouldReceive('disk')->with('public')->andReturn($disk);
        Storage::shouldReceive('disk')->with('local')->andReturn($local);
        $job = new DeleteMedia($media->id);
        try {
            $job->handle();
            $this->fail('Failed storage deletion must be retried.');
        } catch (\RuntimeException $expected) {
        }
        $this->assertSame('deleting', $media->fresh()->status);
        $job->handle();
        $job->handle();
        $this->assertDatabaseMissing('media', ['id' => $media->id]);
    }

    public function test_pixel_limit_is_checked_before_decoding(): void
    {
        $this->owner();
        $image = imagecreatetruecolor(2, 2);
        ob_start();
        imagepng($image);
        $png = ob_get_clean();
        imagedestroy($image);
        // The PNG header advertises 25 MP; even a tiny compressed payload must be rejected first.
        $png = substr_replace($png, pack('NN', 5000, 5000), 16, 8);
        $this->postJson('/api/v1/admin/media', ['file' => UploadedFile::fake()->createWithContent('bomb.png', $png)])->assertUnprocessable();
        $this->assertDatabaseCount('media', 0);
    }

    public function test_retention_preserves_the_exact_utc_analytics_and_audit_cutoff(): void
    {
        $this->travelTo(CarbonImmutable::parse('2026-10-21T12:00:00Z'));
        Queue::fake();
        $boundary = now()->startOfDay()->subDays(89)->toDateString();
        AnalyticsDailyCount::factory()->create(['date' => $boundary]);
        AnalyticsDailyCount::factory()->create(['date' => now()->startOfDay()->subDays(90)->toDateString()]);
        AuditEvent::factory()->create(['created_at' => now()->startOfDay()->subDays(179)]);
        AuditEvent::factory()->create(['created_at' => now()->startOfDay()->subDays(179)->subSecond()]);
        $this->artisan('app:prune')->assertSuccessful();
        $this->artisan('app:prune')->assertSuccessful();
        $this->assertDatabaseCount('analytics_daily_counts', 1);
        $this->assertDatabaseCount('audit_events', 1);
    }

    public function test_cors_preflight_includes_the_documented_mutation_methods(): void
    {
        $r = $this->options('/api/v1/admin/entries/1', [], ['Origin' => 'http://localhost:8080', 'Access-Control-Request-Method' => 'PATCH', 'Access-Control-Request-Headers' => 'authorization,content-type']);
        $r->assertNoContent()->assertHeader('Access-Control-Allow-Origin', 'http://localhost:8080');
        $this->assertStringContainsString('PATCH', $r->headers->get('Access-Control-Allow-Methods'));
        $this->assertStringNotContainsString('*', $r->headers->get('Access-Control-Allow-Origin'));
    }

    public function test_database_session_and_persisted_timestamps_are_utc(): void
    {
        $this->travelTo(CarbonImmutable::parse('2026-10-21T00:00:00Z'));
        $inquiry = Inquiry::factory()->create();
        $this->assertSame('+00:00', DB::selectOne('SELECT @@session.time_zone AS zone')->zone);
        $stored = DB::selectOne("SELECT DATE_FORMAT(submitted_at, '%Y-%m-%d %H:%i:%s') AS stamp FROM inquiries WHERE id = ?", [$inquiry->id]);
        $this->assertSame('2026-10-21 00:00:00', $stored->stamp);
    }
}
