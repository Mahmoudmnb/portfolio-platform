<?php

namespace Tests\Feature;

use App\Models\Category;
use App\Models\Media;
use App\Models\PortfolioEntry;
use App\Models\TeamMember;
use App\Models\Technology;
use App\Models\User;
use Carbon\CarbonImmutable;
use Database\Seeders\DatabaseSeeder;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class ContractTest extends TestCase
{
    use RefreshDatabase;

    public function test_representative_http_responses_are_captured_without_secrets(): void
    {
        $this->travelTo(CarbonImmutable::parse('2026-10-21T09:00:00Z'));
        $this->seed(DatabaseSeeder::class);
        $u = User::factory()->create();
        $m = Media::factory()->create();
        $c = Category::factory()->create(['name' => 'Mobile', 'slug' => 'mobile']);
        $t = Technology::factory()->create(['name' => 'Flutter', 'slug' => 'flutter']);
        $member = TeamMember::factory()->create(['name' => 'Fictional Engineer', 'slug' => 'fictional-engineer', 'is_active' => true, 'photo_media_id' => $m->id]);
        $entry = PortfolioEntry::factory()->create(['title' => 'Field notes', 'slug' => 'field-notes', 'summary' => 'A fictional offline notebook.', 'description' => 'An **offline** notebook.', 'status' => 'published', 'published_at' => now(), 'cover_media_id' => $m->id, 'category_id' => $c->id]);
        $entry->technologies()->attach($t);
        $entry->contributors()->attach($member);
        $entry->gallery()->attach($m, ['alt_text' => 'Notebook example', 'sort_order' => 0]);
        $fixtures = [];
        $capture = function ($method, $path, $actual, $payload = []) use (&$fixtures) {
            $r = $this->json(strtoupper($method), '/api/v1'.$actual, $payload);
            $this->assertLessThan(500, $r->status());
            $body = json_decode($r->getContent());
            if (isset($body->data->token)) {
                $body->data->token = 'TOKEN_PLACEHOLDER';
            }
            $fixtures[] = ['method' => $method, 'path' => $path, 'status' => $r->status(), 'body' => $body];

            return $r;
        };
        foreach (['/entries', '/team-members', '/categories', '/technologies', '/services', '/site-settings', '/ready'] as $path) {
            $capture('get', $path, $path);
        }
        $capture('get', '/entries/{slug}', '/entries/field-notes');
        $capture('get', '/team-members/{slug}', '/team-members/fictional-engineer');
        $capture('get', '/entries', '/entries?per_page=101');
        $capture('post', '/analytics/events', '/analytics/events', ['event_name' => 'page_view', 'path' => '/']);
        $capture('post', '/inquiries', '/inquiries', ['name' => 'Fictional Visitor', 'email' => 'visitor@example.test', 'subject' => 'Hello', 'message' => 'Fictional sample inquiry.']);
        $login = $capture('post', '/admin/auth/login', '/admin/auth/login', ['email' => $u->email, 'password' => 'Fictional-Password-123', 'device_name' => 'Example device']);
        $this->withToken($login->json('data.token'));
        foreach (['/admin/auth/me', '/admin/entries', '/admin/team-members', '/admin/site-settings', '/admin/media', '/admin/inquiries', '/admin/audit-events', '/admin/analytics/summary', '/admin/analytics/daily', '/admin/analytics/top-pages', '/admin/analytics/top-entries', '/admin/analytics/referrers'] as $path) {
            $capture('get', $path, $path);
        }
        $capture('get', '/admin/media/{id}', '/admin/media/'.$m->id);
        $dir = storage_path('framework/testing');
        if (! is_dir($dir)) {
            mkdir($dir, 0770, true);
        }
        file_put_contents($dir.'/contract-responses.json', json_encode($fixtures, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES | JSON_THROW_ON_ERROR));
    }
}
