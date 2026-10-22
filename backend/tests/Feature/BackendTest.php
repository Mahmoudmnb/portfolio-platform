<?php

namespace Tests\Feature;

use App\Jobs\DeleteMedia;
use App\Jobs\ProcessMedia;
use App\Models\AuditEvent;
use App\Models\Category;
use App\Models\Inquiry;
use App\Models\Media;
use App\Models\PortfolioEntry;
use App\Models\TeamMember;
use App\Models\Technology;
use App\Models\User;
use App\Services\ImageInspector;
use Database\Seeders\DatabaseSeeder;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Queue;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Storage;
use Tests\TestCase;

class BackendTest extends TestCase
{
    use RefreshDatabase;

    private function owner(): User
    {
        $u = User::factory()->create();
        $this->withToken($u->createToken('test', ['owner'], now()->addDay())->plainTextToken);

        return $u;
    }

    private function entry(array $overrides = []): array
    {
        return $overrides + ['kind' => 'project', 'title' => 'Field notes', 'summary' => 'A Flutter notebook', 'description' => 'Untrusted **Markdown**'];
    }

    public function test_health_and_generic_errors_have_server_request_ids(): void
    {
        $this->getJson('/up')->assertOk();
        $this->getJson('/api/v1/ready')->assertOk()->assertJsonPath('data.ready', true);
        $r = $this->withHeader('X-Request-ID', 'untrusted')->getJson('/api/v1/missing');
        $r->assertNotFound()->assertJsonPath('code', 'NOT_FOUND')->assertHeader('Cache-Control', 'no-store, private');
        $this->assertNotSame('untrusted', $r->json('request_id'));
        $this->assertSame($r->json('request_id'), $r->headers->get('X-Request-ID'));
        $this->putJson('/api/v1/entries')->assertStatus(405)->assertJsonPath('code', 'METHOD_NOT_ALLOWED');
    }

    public function test_every_admin_route_is_protected_and_there_is_no_registration(): void
    {
        foreach (Route::getRoutes() as $route) {
            if (! str_starts_with($route->uri(), 'api/v1/admin/') || str_ends_with($route->uri(), '/login')) {
                continue;
            }
            $uri = preg_replace('/\{[^}]+\}/', '1', $route->uri());
            foreach (array_diff($route->methods(), ['HEAD']) as $method) {
                $this->json($method, '/'.$uri)->assertUnauthorized();
            }
        }
        $this->postJson('/api/v1/register')->assertNotFound();
    }

    public function test_owner_command_lifecycle_has_no_seed_credentials(): void
    {
        $this->seed(DatabaseSeeder::class);
        $this->assertDatabaseCount('users', 0);
        $this->artisan('app:create-owner')->expectsQuestion('Name', 'Fictional Owner')->expectsQuestion('Email', ' OWNER@EXAMPLE.TEST ')->expectsQuestion('Password (12+ characters, mixed case and numbers)', 'A-long-password-123')->expectsQuestion('Confirm password', 'A-long-password-123')->assertSuccessful();
        $this->assertDatabaseHas('users', ['email' => 'owner@example.test']);
        $this->artisan('app:create-owner')->assertFailed();
        $this->artisan('app:recover-owner --disable')->assertSuccessful();
        $this->assertFalse(User::first()->enabled);
        $this->artisan('app:recover-owner')->expectsQuestion('New password', 'Another-long-123')->expectsQuestion('Confirm password', 'Another-long-123')->assertSuccessful();
        $this->assertTrue(User::first()->enabled);
    }

    public function test_token_lifecycle_and_generic_failures(): void
    {
        $u = User::factory()->create();
        $bad = $this->postJson('/api/v1/admin/auth/login', ['email' => $u->email, 'password' => 'wrong', 'device_name' => 'test'])->assertUnauthorized()->json();
        $other = $this->postJson('/api/v1/admin/auth/login', ['email' => 'absent@example.test', 'password' => 'wrong', 'device_name' => 'test'])->assertUnauthorized()->json();
        $this->assertSame($bad['message'], $other['message']);
        $r = $this->postJson('/api/v1/admin/auth/login', ['email' => strtoupper($u->email), 'password' => 'Fictional-Password-123', 'device_name' => 'Android'])->assertOk()->assertJsonMissingPath('data.user.password');
        $this->withToken($r->json('data.token'))->getJson('/api/v1/admin/auth/me')->assertOk();
        $this->postJson('/api/v1/admin/auth/logout')->assertNoContent();
        $this->getJson('/api/v1/admin/auth/me')->assertUnauthorized();
        $this->withToken($u->createToken('expired', ['owner'], now()->subMinute())->plainTextToken)->getJson('/api/v1/admin/auth/me')->assertUnauthorized();
        $this->withToken($u->createToken('disabled')->plainTextToken);
        $u->update(['enabled' => false]);
        $this->getJson('/api/v1/admin/auth/me')->assertForbidden();
    }

    public function test_password_change_revokes_all_tokens_and_checks_current_password(): void
    {
        $u = $this->owner();
        $u->createToken('second');
        $this->putJson('/api/v1/admin/auth/password', ['current_password' => 'wrong', 'password' => 'New-password-123', 'password_confirmation' => 'New-password-123'])->assertUnprocessable();
        $this->putJson('/api/v1/admin/auth/password', ['current_password' => 'Fictional-Password-123', 'password' => 'New-password-123', 'password_confirmation' => 'New-password-123'])->assertOk();
        $this->assertSame(0, $u->tokens()->count());
        $this->getJson('/api/v1/admin/auth/me')->assertUnauthorized();
    }

    public function test_content_publish_unpublish_delete_and_visibility(): void
    {
        $this->owner();
        $media = Media::factory()->create();
        $draft = $this->postJson('/api/v1/admin/entries', $this->entry())->assertCreated()->json('data');
        $this->getJson('/api/v1/entries/'.$draft['slug'])->assertNotFound();
        $this->patchJson('/api/v1/admin/entries/'.$draft['id'], ['status' => 'published'])->assertUnprocessable();
        $this->patchJson('/api/v1/admin/entries/'.$draft['id'], ['status' => 'published', 'cover_media_id' => $media->id])->assertOk();
        $this->getJson('/api/v1/entries')->assertOk()->assertJsonCount(1, 'data')->assertJsonMissingPath('data.0.status')->assertJsonMissingPath('data.0.description')->assertJsonMissingPath('data.0.cover.disk');
        $this->getJson('/api/v1/entries/'.$draft['slug'])->assertOk()->assertJsonPath('data.description', 'Untrusted **Markdown**');
        $this->deleteJson('/api/v1/admin/entries/'.$draft['id'])->assertConflict();
        $this->deleteJson('/api/v1/admin/media/'.$media->id)->assertConflict();
        $this->patchJson('/api/v1/admin/entries/'.$draft['id'], ['status' => 'archived'])->assertOk();
        $this->getJson('/api/v1/entries/'.$draft['slug'])->assertNotFound();
        $this->deleteJson('/api/v1/admin/entries/'.$draft['id'])->assertNoContent();
        $this->assertDatabaseHas('media', ['id' => $media->id]);
    }

    public function test_slugs_are_stable_and_explicit_duplicates_are_rejected(): void
    {
        $this->owner();
        $a = $this->postJson('/api/v1/admin/entries', $this->entry())->assertCreated()->json('data');
        $b = $this->postJson('/api/v1/admin/entries', $this->entry())->assertCreated()->json('data');
        $this->assertNotSame($a['slug'], $b['slug']);
        $this->postJson('/api/v1/admin/entries', $this->entry(['slug' => $a['slug']]))->assertUnprocessable();
        $this->patchJson('/api/v1/admin/entries/'.$a['id'], ['title' => 'Changed title'])->assertOk()->assertJsonPath('data.slug', $a['slug']);
        $this->patchJson('/api/v1/admin/entries/'.$a['id'], ['slug' => null])->assertUnprocessable();
    }

    public function test_patch_relations_replace_omit_clear_and_rollback(): void
    {
        $this->owner();
        $t = Technology::factory()->create();
        $c = Category::factory()->create();
        $m = Media::factory()->create();
        $a = $this->postJson('/api/v1/admin/entries', $this->entry(['technology_ids' => [$t->id], 'category_id' => $c->id, 'gallery' => [['media_id' => $m->id, 'alt_text' => 'Example']]]))->assertCreated()->json('data');
        $uri = '/api/v1/admin/entries/'.$a['id'];
        $this->patchJson($uri, ['title' => 'Updated'])->assertOk()->assertJsonCount(1, 'data.technologies')->assertJsonCount(1, 'data.gallery');
        $this->patchJson($uri, ['title' => 'Must rollback', 'technology_ids' => [999999]])->assertUnprocessable();
        $this->assertDatabaseHas('portfolio_entries', ['id' => $a['id'], 'title' => 'Updated']);
        $this->patchJson($uri, ['technology_ids' => [$t->id, $t->id]])->assertUnprocessable();
        $this->patchJson($uri, ['technology_ids' => null])->assertUnprocessable();
        $this->deleteJson('/api/v1/admin/categories/'.$c->id)->assertConflict();
        $this->deleteJson('/api/v1/admin/technologies/'.$t->id)->assertConflict();
        $this->patchJson($uri, ['technology_ids' => [], 'gallery' => [], 'category_id' => null])->assertOk()->assertJsonCount(0, 'data.gallery')->assertJsonPath('data.category', null);
        $this->deleteJson('/api/v1/admin/technologies/'.$t->id)->assertNoContent();
    }

    public function test_nested_visibility_and_taxonomies_never_leak_drafts(): void
    {
        $this->owner();
        $m = Media::factory()->create();
        $c = Category::factory()->create();
        $t = Technology::factory()->create();
        $hidden = TeamMember::factory()->create();
        $active = TeamMember::factory()->create(['is_active' => true, 'photo_media_id' => $m->id]);
        $e = PortfolioEntry::factory()->create(['category_id' => $c->id]);
        $e->technologies()->attach($t);
        $e->contributors()->attach([$hidden->id, $active->id]);
        $this->getJson('/api/v1/categories')->assertJsonCount(0, 'data');
        $this->getJson('/api/v1/technologies')->assertJsonCount(0, 'data');
        $this->getJson('/api/v1/team-members/'.$hidden->slug)->assertNotFound();
        $e->update(['status' => 'published', 'published_at' => now(), 'cover_media_id' => $m->id]);
        $this->getJson('/api/v1/entries/'.$e->slug)->assertOk()->assertJsonCount(1, 'data.contributors')->assertJsonPath('data.contributors.0.id', $active->id);
        $this->getJson('/api/v1/categories')->assertJsonCount(1, 'data');
        $this->getJson('/api/v1/admin/entries/'.$e->id)->assertOk()->assertJsonCount(2, 'data.contributors');
        $this->deleteJson('/api/v1/admin/team-members/'.$active->id)->assertNoContent();
        $this->assertDatabaseMissing('entry_contributor', ['team_member_id' => $active->id]);
    }

    public function test_filters_literal_search_order_pagination_and_url_validation(): void
    {
        $this->owner();
        $m = Media::factory()->create();
        PortfolioEntry::factory()->create(['title' => '100% Useful', 'status' => 'published', 'published_at' => now(), 'cover_media_id' => $m->id, 'featured' => true]);
        PortfolioEntry::factory()->create(['title' => 'Normal title', 'status' => 'published', 'published_at' => now(), 'cover_media_id' => $m->id]);
        $this->getJson('/api/v1/entries?q=%25')->assertOk()->assertJsonCount(1, 'data');
        $this->getJson('/api/v1/entries?q=USEFUL')->assertOk()->assertJsonCount(1, 'data');
        $this->getJson('/api/v1/entries?per_page=1')->assertOk()->assertJsonPath('meta.total', 2)->assertJsonPath('data.0.featured', true);
        foreach (['per_page=101', 'page=0', 'featured=maybe', 'kind=unknown', 'sort=title', 'unknown=x'] as $q) {
            $this->getJson('/api/v1/entries?'.$q)->assertUnprocessable();
        }
        foreach (['javascript:alert(1)', 'https://user:pass@example.test/path', 'data:text/html,a'] as $url) {
            $this->postJson('/api/v1/admin/entries', $this->entry(['demo_url' => $url]))->assertUnprocessable();
        }
        $this->postJson('/api/v1/admin/entries', $this->entry(['published_at' => now()->addDay()->toISOString()]))->assertUnprocessable();
        $this->postJson('/api/v1/admin/entries', $this->entry(['untrusted' => 'value']))->assertUnprocessable();
    }

    public function test_settings_full_put_and_team_activation_guards(): void
    {
        $this->owner();
        $this->seed(DatabaseSeeder::class);
        $this->putJson('/api/v1/admin/site-settings', ['site_title' => 'Partial'])->assertUnprocessable();
        $this->postJson('/api/v1/admin/team-members', ['name' => 'Example', 'role_title' => 'Engineer', 'bio' => 'Bio', 'is_active' => true])->assertUnprocessable();
        $this->postJson('/api/v1/admin/services', ['title' => 'Example', 'summary' => 'Example', 'description' => 'Text', 'icon_key' => '<svg onload=alert(1)>'])->assertUnprocessable();
        $this->getJson('/api/v1/site-settings')->assertOk()->assertJsonMissingPath('data.logo_media_id');
    }

    public function test_upload_processing_strips_metadata_and_is_idempotent(): void
    {
        $this->owner();
        Storage::fake('local');
        Storage::fake('public');
        Queue::fake();
        $image = UploadedFile::fake()->image('../../gps.png', 40, 20);
        $r = $this->postJson('/api/v1/admin/media', ['file' => $image])->assertCreated()->assertJsonPath('data.status', 'processing');
        $m = Media::findOrFail($r->json('data.id'));
        Queue::assertPushed(ProcessMedia::class);
        $this->postJson('/api/v1/admin/entries', $this->entry(['cover_media_id' => $m->id]))->assertUnprocessable();
        $job = new ProcessMedia($m->id);
        $job->handle(new ImageInspector);
        $job->handle(new ImageInspector);
        $m->refresh();
        $this->assertSame('ready', $m->status);
        Storage::disk('local')->assertMissing('uploads/'.$m->storage_key);
        $bytes = Storage::disk('public')->get($m->variantKey());
        $this->assertSame('image/webp', getimagesizefromstring($bytes)['mime']);
        $this->assertStringNotContainsString('Exif', $bytes);
        $this->assertStringNotContainsString('gps.png', $m->storage_key);
        $thumb = getimagesizefromstring(Storage::disk('public')->get($m->variantKey('thumbnail')));
        $this->assertSame(40, $thumb[0]);
        $this->getJson('/api/v1/admin/media/'.$m->id)->assertOk()->assertJsonPath('data.status', 'ready')->assertJsonPath('data.usage_count', 0);
    }

    public function test_forged_images_and_failed_processing_and_deletion_state(): void
    {
        $this->owner();
        Storage::fake('local');
        Storage::fake('public');
        Queue::fake();
        $this->postJson('/api/v1/admin/media', ['file' => UploadedFile::fake()->createWithContent('fake.png', '<svg/>')])->assertUnprocessable();
        $this->postJson('/api/v1/admin/media', ['file' => UploadedFile::fake()->image('wide.png', 8001, 1)])->assertUnprocessable();
        $m = Media::factory()->create(['status' => 'processing']);
        Storage::disk('local')->put('uploads/'.$m->storage_key, 'corrupt');
        $job = new ProcessMedia($m->id);
        $job->failed(new \RuntimeException('private failure'));
        $job->failed(null);
        $this->assertSame('failed', $m->fresh()->status);
        $this->deleteJson('/api/v1/admin/media/'.$m->id)->assertNoContent();
        $this->assertSame('deleting', $m->fresh()->status);
        $this->postJson('/api/v1/admin/entries', $this->entry(['cover_media_id' => $m->id]))->assertUnprocessable();
        $delete = new DeleteMedia($m->id);
        $delete->handle();
        $delete->handle();
        $this->assertDatabaseMissing('media', ['id' => $m->id]);
    }

    public function test_contact_is_private_honeypot_and_status_audit_is_redacted(): void
    {
        $payload = ['name' => 'Visitor', 'email' => 'visitor@example.test', 'subject' => 'Hello', 'message' => 'Private contact message'];
        $this->postJson('/api/v1/inquiries', $payload)->assertCreated()->assertJsonMissingPath('data.id')->assertJsonMissingPath('data.email');
        $this->postJson('/api/v1/inquiries', $payload + ['website' => 'spam'])->assertCreated();
        $this->assertDatabaseCount('inquiries', 1);
        $this->getJson('/api/v1/inquiries')->assertStatus(405);
        $this->getJson('/api/v1/inquiries/1')->assertNotFound();
        $this->owner();
        $id = Inquiry::first()->id;
        $this->getJson('/api/v1/admin/inquiries/'.$id)->assertOk()->assertJsonPath('data.status', 'new');
        $this->patchJson('/api/v1/admin/inquiries/'.$id, ['status' => 'replied', 'internal_note' => 'Private note'])->assertOk();
        $this->patchJson('/api/v1/admin/inquiries/'.$id, ['email' => 'changed@example.test'])->assertUnprocessable();
        $audit = AuditEvent::first()->toJson();
        foreach (['visitor@example.test', 'Private contact message', 'Private note'] as $private) {
            $this->assertStringNotContainsString($private, $audit);
        }
    }

    public function test_analytics_are_atomic_null_buckets_and_private_dimensions(): void
    {
        $event = ['event_name' => 'page_view', 'path' => '/about/', 'referrer' => 'https://www.Example.org/private?q=secret'];
        $this->postJson('/api/v1/analytics/events', $event)->assertAccepted();
        $this->postJson('/api/v1/analytics/events', $event)->assertAccepted();
        $this->assertDatabaseCount('analytics_daily_counts', 1);
        $this->assertDatabaseHas('analytics_daily_counts', ['path' => '/about', 'referrer_host' => 'example.org', 'count' => 2]);
        $this->postJson('/api/v1/analytics/events', ['event_name' => 'page_view', 'path' => '/'])->assertAccepted();
        $this->postJson('/api/v1/analytics/events', ['event_name' => 'page_view', 'path' => '/'])->assertAccepted();
        $this->assertDatabaseCount('analytics_daily_counts', 2);
        foreach (['/about?q=x', '//evil.test', '/unbounded/arbitrary', '/about#secret'] as $path) {
            $this->postJson('/api/v1/analytics/events', ['event_name' => 'page_view', 'path' => $path])->assertUnprocessable();
        }
        $this->postJson('/api/v1/analytics/events', ['event_name' => 'page_view', 'path' => '/', 'ip' => 'private'])->assertUnprocessable();
        $draft = PortfolioEntry::factory()->create();
        $this->postJson('/api/v1/analytics/events', ['event_name' => 'entry_view', 'path' => '/entries/'.$draft->slug, 'entry_id' => $draft->id])->assertUnprocessable();
        $this->postJson('/api/v1/analytics/events', ['event_name' => 'contact_click', 'path' => '/contact', 'entry_id' => $draft->id])->assertUnprocessable();
    }

    public function test_analytics_cardinality_zero_days_and_deleted_history(): void
    {
        $this->owner();
        config(['portfolio.referrer_daily_limit' => 1]);
        foreach (['one.test', 'two.test', 'three.test'] as $host) {
            $this->postJson('/api/v1/analytics/events', ['event_name' => 'page_view', 'path' => '/', 'referrer' => 'https://'.$host])->assertAccepted();
        }
        $this->assertDatabaseHas('analytics_daily_counts', ['referrer_host' => 'other', 'count' => 2]);
        $this->getJson('/api/v1/admin/analytics/summary')->assertOk()->assertJsonPath('data.page_view', 3);
        $this->getJson('/api/v1/admin/analytics/daily')->assertOk()->assertJsonCount(30, 'data')->assertJsonPath('data.0.page_view', 0);
        $this->getJson('/api/v1/admin/analytics/summary?start_date=2020-01-01')->assertUnprocessable();
        $this->getJson('/api/v1/admin/analytics/summary?end_date='.now()->addDay()->toDateString())->assertUnprocessable();
        $m = Media::factory()->create();
        $e = PortfolioEntry::factory()->create(['status' => 'published', 'published_at' => now(), 'cover_media_id' => $m->id]);
        $this->postJson('/api/v1/analytics/events', ['event_name' => 'entry_view', 'path' => '/entries/'.$e->slug, 'entry_id' => $e->id])->assertAccepted();
        $e->delete();
        $this->getJson('/api/v1/admin/analytics/top-entries')->assertOk()->assertJsonPath('data.0.entry_id', null)->assertJsonPath('data.0.total', 1);
        config(['portfolio.analytics_enabled' => false]);
        $this->postJson('/api/v1/analytics/events', ['event_name' => 'page_view', 'path' => '/contact'])->assertAccepted();
        $this->assertDatabaseMissing('analytics_daily_counts', ['path' => '/contact']);
    }

    public function test_retention_uses_utc_boundaries_and_preserves_referenced_media(): void
    {
        $this->travelTo(now('UTC')->startOfDay()->addHours(12));
        $this->owner();
        Queue::fake();
        Storage::fake('local');
        Storage::fake('public');
        Inquiry::factory()->create(['submitted_at' => now()->startOfDay()->subDays(179)]);
        Inquiry::factory()->create(['submitted_at' => now()->startOfDay()->subDays(179)->subSecond()]);
        $used = Media::factory()->create(['created_at' => now()->subDays(2)]);
        PortfolioEntry::factory()->create(['cover_media_id' => $used->id]);
        $orphan = Media::factory()->create(['created_at' => now()->subDays(2)]);
        $this->artisan('app:prune')->assertSuccessful();
        $this->artisan('app:prune')->assertSuccessful();
        $this->assertDatabaseCount('inquiries', 1);
        $this->assertSame('ready', $used->fresh()->status);
        $this->assertSame('deleting', $orphan->fresh()->status);
    }

    public function test_rate_limits_and_cors_are_explicit(): void
    {
        for ($i = 0; $i < 5; $i++) {
            $this->postJson('/api/v1/admin/auth/login', ['email' => 'absent@example.test', 'password' => 'wrong', 'device_name' => 'test'])->assertUnauthorized();
        }
        $this->postJson('/api/v1/admin/auth/login', ['email' => 'absent@example.test', 'password' => 'wrong', 'device_name' => 'test'])->assertStatus(429)->assertHeader('Retry-After');
        $this->withHeader('Origin', 'http://localhost:8080')->getJson('/api/v1/entries')->assertHeader('Access-Control-Allow-Origin', 'http://localhost:8080');
        $this->withHeader('Origin', 'https://untrusted.test')->getJson('/api/v1/entries')->assertHeader('Access-Control-Allow-Origin', 'http://localhost:8080');
    }

    public function test_entry_collection_query_count_does_not_grow_with_rows(): void
    {
        $u = User::factory()->create();
        $m = Media::factory()->create(['uploader_id' => $u->id]);
        PortfolioEntry::factory()->create(['status' => 'published', 'published_at' => now(), 'cover_media_id' => $m->id]);
        DB::enableQueryLog();
        $this->getJson('/api/v1/entries')->assertOk();
        $first = count(DB::getQueryLog());
        DB::flushQueryLog();
        PortfolioEntry::factory()->count(15)->create(['status' => 'published', 'published_at' => now(), 'cover_media_id' => $m->id]);
        DB::flushQueryLog();
        $this->getJson('/api/v1/entries')->assertOk()->assertJsonCount(16, 'data');
        $second = count(DB::getQueryLog());
        DB::disableQueryLog();
        $this->assertLessThanOrEqual($first + 2, $second);
    }

    public function test_numeric_string_entry_ids_share_the_canonical_analytics_bucket(): void
    {
        $this->owner();
        $m = Media::factory()->create();
        $e = PortfolioEntry::factory()->create(['status' => 'published', 'published_at' => now(), 'cover_media_id' => $m->id]);
        foreach ([$e->id, (string) $e->id] as $id) {
            $this->postJson('/api/v1/analytics/events', ['event_name' => 'entry_view', 'path' => '/entries/'.$e->slug, 'entry_id' => $id])->assertAccepted();
        }
        $this->assertDatabaseCount('analytics_daily_counts', 1);
        $this->assertDatabaseHas('analytics_daily_counts', ['entry_id' => $e->id, 'count' => 2]);
    }

    public function test_full_settings_put_can_clear_social_links(): void
    {
        $this->owner();
        $this->seed(DatabaseSeeder::class);
        $settings = ['site_title' => 'Portfolio', 'tagline' => 'Example', 'introduction' => 'Example introduction', 'contact_email' => 'contact@example.test', 'availability' => 'limited', 'default_seo_title' => 'Portfolio', 'default_seo_description' => 'Example description', 'social_links' => [['label' => 'Website', 'url' => 'https://example.test']]];
        $this->putJson('/api/v1/admin/site-settings', $settings)->assertOk()->assertJsonCount(1, 'data.social_links');
        $settings['social_links'] = [];
        $this->putJson('/api/v1/admin/site-settings', $settings)->assertOk()->assertJsonCount(0, 'data.social_links');
        $this->getJson('/api/v1/site-settings')->assertOk()->assertJsonCount(0, 'data.social_links');
    }
}
