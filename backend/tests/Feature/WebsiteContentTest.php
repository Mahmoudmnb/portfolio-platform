<?php

namespace Tests\Feature;

use App\Jobs\NotifyInquiry;
use App\Models\Inquiry;
use App\Models\Media;
use App\Models\Page;
use App\Models\PortfolioEntry;
use App\Models\User;
use Database\Seeders\DatabaseSeeder;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Facades\Bus;
use Illuminate\Support\Facades\Mail;
use Tests\TestCase;

class WebsiteContentTest extends TestCase
{
    use RefreshDatabase;

    private function owner(): void
    {
        $user = User::factory()->create();
        $this->withToken($user->createToken('test')->plainTextToken);
    }

    private function pagePayload(string $pageKey = 'home'): array
    {
        return ['status' => 'draft', 'content' => [$pageKey === 'home' ? 'hero' : 'intro' => ['title' => 'Fictional studio']], 'seo' => ['title' => 'Fictional studio', 'meta_description' => 'Example content.']];
    }

    public function test_fixed_pages_publish_replace_and_unpublish_without_leaking_private_fields(): void
    {
        $this->getJson('/api/v1/pages/home')->assertNotFound();
        $this->putJson('/api/v1/admin/pages/home', $this->pagePayload())->assertUnauthorized();
        $this->owner();
        foreach (['home', 'about', 'services', 'projects', 'contact'] as $key) {
            $this->putJson('/api/v1/admin/pages/'.$key, $this->pagePayload($key))->assertOk()->assertJsonPath('data.status', 'draft');
            $this->getJson('/api/v1/pages/'.$key)->assertNotFound();
        }
        $this->getJson('/api/v1/admin/pages')->assertOk()->assertJsonCount(5, 'data');
        $payload = $this->pagePayload();
        $payload['status'] = 'published';
        $payload['content']['hero']['primary_cta'] = ['label' => 'Contact', 'url' => '/contact'];
        $payload['content']['section_headings'] = ['highlights' => ['title' => 'Why work with us']];
        $payload['content']['highlights'] = [['title' => 'Later', 'sort_order' => 9], ['title' => 'Hidden', 'is_visible' => false], ['title' => 'First', 'sort_order' => -1]];
        $this->putJson('/api/v1/admin/pages/home', $payload)->assertOk()->assertJsonCount(3, 'data.content.highlights');
        $this->getJson('/api/v1/pages/home')->assertOk()->assertJsonCount(2, 'data.content.highlights')->assertJsonPath('data.content.highlights.0.title', 'First')->assertJsonPath('data.seo.robots_index', true)->assertJsonMissingPath('data.status')->assertJsonMissingPath('data.og_image_media_id')->assertHeader('Cache-Control', 'no-store, private');
        unset($payload['content']['highlights']);
        $payload['status'] = 'draft';
        $this->putJson('/api/v1/admin/pages/home', $payload)->assertOk()->assertJsonMissingPath('data.content.highlights');
        $this->getJson('/api/v1/pages/home')->assertNotFound();
        $this->putJson('/api/v1/admin/pages/blog', $payload)->assertNotFound();
    }

    public function test_typed_sections_reject_unknown_nested_keys_and_unsafe_links(): void
    {
        $this->owner();
        foreach ([
            ['content' => ['hero' => ['title' => 'Example', 'html' => '<script>']]],
            ['content' => ['intro' => ['title' => 'Wrong section']]],
            ['seo' => ['title' => 'Example', 'meta_description' => 'Example', 'secret' => 'hidden']],
            ['content' => ['hero' => ['title' => 'Example', 'primary_cta' => ['label' => 'Bad', 'url' => 'javascript:alert(1)']]]],
            ['content' => ['hero' => ['title' => 'Example', 'primary_cta' => ['label' => 'Bad', 'url' => '//evil.test']]]],
            ['content' => ['hero' => ['title' => str_repeat('x', 501)]]],
        ] as $invalid) {
            $this->putJson('/api/v1/admin/pages/home', array_replace($this->pagePayload(), $invalid))->assertUnprocessable();
        }
        $this->assertDatabaseCount('pages', 0);
    }

    public function test_page_featured_references_follow_publication_and_keep_editor_order(): void
    {
        $this->owner();
        $media = Media::factory()->create();
        $first = PortfolioEntry::factory()->create(['status' => 'published', 'published_at' => now(), 'cover_media_id' => $media->id]);
        $second = PortfolioEntry::factory()->create(['status' => 'published', 'published_at' => now(), 'cover_media_id' => $media->id]);
        $draft = PortfolioEntry::factory()->create();
        $payload = $this->pagePayload();
        $payload['status'] = 'published';
        $payload['featured_entry_ids'] = [$second->id, $draft->id, $first->id];
        $this->putJson('/api/v1/admin/pages/home', $payload)->assertOk()->assertJsonCount(3, 'data.featured_projects');
        $this->getJson('/api/v1/pages/home')->assertOk()->assertJsonCount(2, 'data.featured_projects')->assertJsonPath('data.featured_projects.0.id', $second->id)->assertJsonMissingPath('data.featured_entry_ids')->assertJsonMissingPath('data.featured_projects.0.status');
        $second->update(['status' => 'draft']);
        $this->getJson('/api/v1/pages/home')->assertOk()->assertJsonCount(1, 'data.featured_projects');
        $payload['featured_entry_ids'] = [];
        $this->putJson('/api/v1/admin/pages/home', $payload)->assertOk()->assertJsonCount(0, 'data.featured_entry_ids');
    }

    public function test_new_media_references_protect_drafts_and_reject_processing_images(): void
    {
        $this->owner();
        $media = Media::factory()->create();
        $payload = $this->pagePayload() + ['og_image_media_id' => $media->id];
        $this->putJson('/api/v1/admin/pages/home', $payload)->assertOk();
        $this->getJson('/api/v1/admin/media?usage=used')->assertOk()->assertJsonPath('meta.total', 1)->assertJsonPath('data.0.usage_count', 1);
        $this->deleteJson('/api/v1/admin/media/'.$media->id)->assertConflict();
        $processing = Media::factory()->create(['status' => 'processing']);
        $payload['og_image_media_id'] = $processing->id;
        $this->putJson('/api/v1/admin/pages/home', $payload)->assertUnprocessable();
        $this->assertSame($media->id, Page::first()->og_image_media_id);
        $service = ['title' => 'Application development', 'summary' => 'Example', 'description' => 'Example', 'features' => ['Offline support'], 'cover_media_id' => $media->id, 'cta_label' => 'Contact', 'cta_url' => '/contact', 'seo_title' => 'Custom service'];
        $id = $this->postJson('/api/v1/admin/services', $service)->assertCreated()->json('data.id');
        $this->patchJson('/api/v1/admin/services/'.$id, ['cover_media_id' => $processing->id])->assertUnprocessable();
        $this->patchJson('/api/v1/admin/services/'.$id, ['is_active' => true])->assertOk();
        $this->getJson('/api/v1/services')->assertOk()->assertJsonPath('data.0.features.0', 'Offline support')->assertJsonPath('data.0.seo_title', 'Custom service');
    }

    public function test_settings_extend_existing_put_and_filter_ordered_visible_links(): void
    {
        $this->owner();
        $this->seed(DatabaseSeeder::class);
        $media = Media::factory()->create();
        $settings = ['site_title' => 'Studio', 'tagline' => 'Example', 'introduction' => 'Example', 'contact_email' => 'contact@example.test', 'availability' => 'available', 'default_seo_title' => 'Studio', 'default_seo_description' => 'Example', 'social_links' => [], 'logo_light_media_id' => $media->id, 'navigation' => [['label' => 'Hidden', 'url' => '/about', 'is_visible' => false], ['label' => 'Work', 'url' => '/projects', 'sort_order' => 5], ['label' => 'Home', 'url' => '/', 'sort_order' => 0]], 'shared_cta' => ['title' => 'Build together', 'button_label' => 'Contact', 'button_url' => '/contact'], 'footer' => ['description' => 'Studio', 'established_year' => 2020, 'practice_links' => []]];
        $this->putJson('/api/v1/admin/site-settings', $settings)->assertOk()->assertJsonCount(3, 'data.navigation');
        $this->getJson('/api/v1/site-settings')->assertOk()->assertJsonCount(2, 'data.navigation')->assertJsonPath('data.navigation.0.label', 'Home')->assertJsonPath('data.logo_light.id', $media->id)->assertJsonMissingPath('data.logo_light_media_id');
        $this->deleteJson('/api/v1/admin/media/'.$media->id)->assertConflict();
        $settings['navigation'][0]['url'] = '//evil.test';
        $this->putJson('/api/v1/admin/site-settings', $settings)->assertUnprocessable();
    }

    public function test_projects_preserve_kind_and_add_detail_platforms_stores_and_seo(): void
    {
        $this->owner();
        $media = Media::factory()->create();
        $entry = ['kind' => 'project', 'project_type' => 'mobile_app', 'title' => 'Fictional notebook', 'summary' => 'Offline notes', 'description' => 'Full description', 'status' => 'published', 'cover_media_id' => $media->id, 'challenge' => 'Offline work', 'solution' => 'Local sync', 'outcomes' => ['Works offline'], 'platforms' => ['android', 'ios'], 'store_links' => [['platform' => 'android', 'label' => 'Play Store', 'url' => 'https://example.test/app']], 'seo_title' => 'Custom SEO'];
        $created = $this->postJson('/api/v1/admin/entries', $entry)->assertCreated()->json('data');
        $this->getJson('/api/v1/entries?kind=project&project_type=mobile_app&sort=sort_order')->assertOk()->assertJsonPath('meta.total', 1)->assertJsonPath('data.0.platforms', ['android', 'ios'])->assertJsonMissingPath('data.0.challenge');
        $this->getJson('/api/v1/entries/'.$created['slug'])->assertOk()->assertJsonPath('data.challenge', 'Offline work')->assertJsonPath('data.outcomes.0', 'Works offline')->assertJsonPath('data.seo_title', 'Custom SEO');
        $this->patchJson('/api/v1/admin/entries/'.$created['id'], ['outcomes' => [], 'seo_title' => null])->assertOk()->assertJsonPath('data.seo_title', 'Fictional notebook')->assertJsonPath('data.outcomes', []);
        $this->patchJson('/api/v1/admin/entries/'.$created['id'], ['platforms' => ['invalid']])->assertUnprocessable();
        $this->patchJson('/api/v1/admin/entries/'.$created['id'], ['store_links' => [['platform' => 'android', 'label' => 'Unsafe', 'url' => 'javascript:alert(1)']]])->assertUnprocessable();
        $this->getJson('/api/v1/entries?project_type=invalid')->assertUnprocessable();
        $this->getJson('/api/v1/entries?sort=-published_at')->assertOk();
        foreach (['id', 'created_at', 'updated_at', 'sort_order'] as $sort) {
            $this->getJson('/api/v1/admin/entries?sort='.$sort.'&direction=desc')->assertOk();
        }
        $this->getJson('/api/v1/admin/entries?sort=-published_at')->assertUnprocessable();
    }

    public function test_media_alt_updates_and_hidden_team_links_are_reflected_publicly(): void
    {
        $this->owner();
        $media = Media::factory()->create();
        $this->patchJson('/api/v1/admin/media/'.$media->id, ['alt_text' => 'Notebook screen'])->assertOk()->assertJsonPath('data.alt', 'Notebook screen');
        $member = ['name' => 'Example engineer', 'role_title' => 'Engineer', 'bio' => 'Public bio', 'photo_media_id' => $media->id, 'is_active' => true, 'links' => [['label' => 'Hidden', 'url' => 'https://example.test/private', 'is_visible' => false], ['label' => 'Public', 'url' => 'https://example.test/public']]];
        $created = $this->postJson('/api/v1/admin/team-members', $member)->assertCreated()->assertJsonCount(2, 'data.links')->json('data');
        $this->getJson('/api/v1/team-members/'.$created['slug'])->assertOk()->assertJsonCount(1, 'data.links')->assertJsonPath('data.links.0.label', 'Public')->assertJsonPath('data.photo.alt', 'Notebook screen')->assertJsonPath('data.photo.mime_type', 'image/webp');
        $this->patchJson('/api/v1/admin/media/'.$media->id, ['alt_text' => str_repeat('x', 501)])->assertUnprocessable();
        $this->patchJson('/api/v1/admin/media/'.$media->id, ['alt_text' => null])->assertOk()->assertJsonPath('data.alt', null);
    }

    public function test_inquiry_source_and_generic_notification_keep_visitor_data_out_of_jobs_and_mail(): void
    {
        Bus::fake();
        config(['portfolio.inquiry_notification_email' => 'business@example.test']);
        $payload = ['name' => 'Fictional visitor', 'email' => 'visitor@example.test', 'subject' => 'Private subject', 'message' => 'Private inquiry contents', 'source_page' => '/contact'];
        $this->postJson('/api/v1/inquiries', $payload)->assertCreated()->assertExactJson(['data' => ['message' => 'Thank you. Your inquiry has been received.']]);
        $inquiry = Inquiry::firstOrFail();
        $this->assertSame('/contact', $inquiry->source_page);
        Bus::assertDispatched(NotifyInquiry::class, fn ($job) => $job->inquiryId === $inquiry->id && $job->afterCommit);
        $job = new NotifyInquiry($inquiry->id);
        $this->assertStringNotContainsString($payload['message'], serialize($job));
        $job->handle();
        $job->handle();
        $messages = Mail::getSymfonyTransport()->messages();
        $this->assertCount(1, $messages);
        $message = $messages->first()->getOriginalMessage()->toString();
        foreach (['visitor@example.test', 'Private subject', 'Private inquiry contents'] as $private) {
            $this->assertStringNotContainsString($private, $message);
        }
        Bus::assertDispatchedTimes(NotifyInquiry::class, 1);
        $this->postJson('/api/v1/inquiries', $payload + ['website' => 'spam'])->assertCreated();
        $this->assertDatabaseCount('inquiries', 1);
        Bus::assertDispatchedTimes(NotifyInquiry::class, 1);
        $payload['source_page'] = '/contact?email=private';
        $this->postJson('/api/v1/inquiries', $payload)->assertUnprocessable();
    }

    public function test_documented_page_and_resource_requests_are_accepted(): void
    {
        $this->owner();
        $this->seed(DatabaseSeeder::class);
        $examples = file_get_contents(base_path('docs/flutter-api-examples.md'));
        preg_match_all('/<!-- page:([a-z]+) -->\s*```json\s*(.*?)\s*```/s', $examples, $matches, PREG_SET_ORDER);
        $this->assertCount(5, $matches);
        foreach ($matches as $match) {
            $payload = json_decode($match[2], true, flags: JSON_THROW_ON_ERROR);
            $this->putJson('/api/v1/admin/pages/'.$match[1], $payload)->assertOk()->assertJsonPath('data.status', 'draft');
        }
        foreach (['PUT `/admin/site-settings`' => 'put', 'POST `/admin/entries`' => 'post', 'POST `/admin/services`' => 'post'] as $heading => $method) {
            preg_match('/## '.preg_quote($heading, '/').'\s*```json\s*(.*?)\s*```/s', $examples, $match);
            $this->assertArrayHasKey(1, $match);
            preg_match('~`([^`]+)`~', $heading, $path);
            $this->json(strtoupper($method), '/api/v1'.$path[1], json_decode($match[1], true, flags: JSON_THROW_ON_ERROR))->assertStatus($method === 'post' ? 201 : 200);
        }
    }

    public function test_notification_dispatch_failure_keeps_inquiry_and_can_be_retried(): void
    {
        config(['portfolio.inquiry_notification_email' => 'business@example.test']);
        Bus::shouldReceive('dispatch')->once()->andThrow(new \RuntimeException('Fictional queue outage'));
        $this->postJson('/api/v1/inquiries', ['name' => 'Fictional visitor', 'email' => 'visitor@example.test', 'subject' => 'Example', 'message' => 'Private sample'])->assertCreated();
        $inquiry = Inquiry::firstOrFail();
        $this->assertNull($inquiry->notified_at);
        Bus::fake();
        $this->artisan('app:retry-inquiry-notification', ['id' => $inquiry->id])->assertSuccessful();
        Bus::assertDispatched(NotifyInquiry::class, fn ($job) => $job->inquiryId === $inquiry->id);
        config(['portfolio.inquiry_notification_email' => null]);
        $this->artisan('app:retry-inquiry-notification', ['id' => $inquiry->id])->assertFailed();
    }

    public function test_demo_pages_are_idempotent_drafts_and_do_not_create_an_owner(): void
    {
        $this->artisan('app:demo')->assertSuccessful();
        $this->artisan('app:demo')->assertSuccessful();
        $this->assertDatabaseCount('pages', 5);
        $this->assertDatabaseCount('users', 0);
        $this->assertSame(0, Page::where('status', 'published')->count());
        $this->getJson('/api/v1/pages/home')->assertNotFound();
    }

    public function test_json_field_numbers_and_booleans_have_stable_response_types(): void
    {
        $this->owner();
        $payload = $this->pagePayload();
        $payload['seo']['robots_index'] = '0';
        $payload['content']['highlights'] = [['title' => 'Example', 'sort_order' => '3', 'is_visible' => '1']];
        $this->putJson('/api/v1/admin/pages/home', $payload)->assertOk()->assertJsonPath('data.seo.robots_index', false)->assertJsonPath('data.content.highlights.0.sort_order', 3)->assertJsonPath('data.content.highlights.0.is_visible', true);
        $this->seed(DatabaseSeeder::class);
        $settings = ['site_title' => 'Studio', 'tagline' => 'Example', 'introduction' => 'Example', 'contact_email' => 'contact@example.test', 'availability' => 'available', 'default_seo_title' => 'Studio', 'default_seo_description' => 'Example', 'social_links' => [], 'footer' => ['established_year' => '2020'], 'navigation' => [['label' => 'Home', 'url' => '/', 'sort_order' => '2', 'open_in_new_tab' => '0']]];
        $this->putJson('/api/v1/admin/site-settings', $settings)->assertOk()->assertJsonPath('data.footer.established_year', 2020)->assertJsonPath('data.navigation.0.sort_order', 2)->assertJsonPath('data.navigation.0.open_in_new_tab', false);
    }
}
