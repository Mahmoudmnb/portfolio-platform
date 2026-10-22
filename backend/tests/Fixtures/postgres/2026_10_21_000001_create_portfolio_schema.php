<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('media', function (Blueprint $t) {
            $t->id();
            $t->string('storage_key')->unique();
            $t->string('disk', 40);
            $t->string('original_filename', 255);
            $t->string('mime_type', 40);
            $t->unsignedBigInteger('bytes');
            $t->unsignedInteger('width');
            $t->unsignedInteger('height');
            $t->string('status', 20)->default('processing')->index();
            $t->foreignId('uploader_id')->constrained('users')->restrictOnDelete();
            $t->timestampsTz();
        });
        Schema::create('categories', function (Blueprint $t) {
            $t->id();
            $t->string('slug', 160)->unique();
            $t->string('name', 120);
            $t->text('description')->nullable();
            $t->integer('sort_order')->default(0);
            $t->timestampsTz();
        });
        Schema::create('technologies', function (Blueprint $t) {
            $t->id();
            $t->string('slug', 160)->unique();
            $t->string('name', 120);
            $t->string('website_url', 2048)->nullable();
            $t->timestampsTz();
        });
        Schema::create('team_members', function (Blueprint $t) {
            $t->id();
            $t->string('slug', 160)->unique();
            $t->string('name', 120);
            $t->string('role_title', 180);
            $t->text('bio');
            $t->foreignId('photo_media_id')->nullable()->constrained('media')->restrictOnDelete();
            $t->boolean('is_active')->default(false);
            $t->integer('sort_order')->default(0);
            $t->timestampsTz();
            $t->index(['is_active', 'sort_order', 'id']);
        });
        Schema::create('team_member_links', function (Blueprint $t) {
            $t->id();
            $t->foreignId('team_member_id')->constrained()->cascadeOnDelete();
            $t->string('label', 80);
            $t->string('url', 2048);
            $t->integer('sort_order')->default(0);
            $t->timestampsTz();
        });
        Schema::create('portfolio_entries', function (Blueprint $t) {
            $t->id();
            $t->string('kind', 20);
            $t->string('slug', 160)->unique();
            $t->string('title', 180);
            $t->string('summary', 500);
            $t->text('description');
            $t->foreignId('category_id')->nullable()->constrained()->restrictOnDelete();
            $t->string('status', 20)->default('draft');
            $t->timestampTz('published_at')->nullable();
            $t->boolean('featured')->default(false);
            $t->integer('sort_order')->default(0);
            $t->foreignId('cover_media_id')->nullable()->constrained('media')->restrictOnDelete();
            foreach (['repository_url', 'demo_url', 'external_url'] as $c) {
                $t->string($c, 2048)->nullable();
            } $t->timestampsTz();
            $t->index(['status', 'published_at']);
            $t->index(['kind', 'featured', 'sort_order', 'id']);
        });
        Schema::create('entry_technology', function (Blueprint $t) {
            $t->foreignId('entry_id')->constrained('portfolio_entries')->cascadeOnDelete();
            $t->foreignId('technology_id')->constrained()->restrictOnDelete();
            $t->primary(['entry_id', 'technology_id']);
        });
        Schema::create('entry_contributor', function (Blueprint $t) {
            $t->foreignId('entry_id')->constrained('portfolio_entries')->cascadeOnDelete();
            $t->foreignId('team_member_id')->constrained()->cascadeOnDelete();
            $t->primary(['entry_id', 'team_member_id']);
        });
        Schema::create('entry_media', function (Blueprint $t) {
            $t->foreignId('entry_id')->constrained('portfolio_entries')->cascadeOnDelete();
            $t->foreignId('media_id')->constrained('media')->restrictOnDelete();
            $t->string('alt_text', 500);
            $t->integer('sort_order')->default(0);
            $t->primary(['entry_id', 'media_id']);
        });
        Schema::create('services', function (Blueprint $t) {
            $t->id();
            $t->string('slug', 160)->unique();
            $t->string('title', 180);
            $t->string('summary', 500);
            $t->text('description');
            $t->string('icon_key', 80)->nullable();
            $t->boolean('is_active')->default(false);
            $t->integer('sort_order')->default(0);
            $t->timestampsTz();
            $t->index(['is_active', 'sort_order', 'id']);
        });
        Schema::create('site_settings', function (Blueprint $t) {
            $t->id();
            $t->string('site_title', 180);
            $t->string('tagline', 500);
            $t->text('introduction');
            $t->string('contact_email', 254);
            $t->string('availability', 20)->default('available');
            $t->foreignId('logo_media_id')->nullable()->constrained('media')->restrictOnDelete();
            $t->string('default_seo_title', 180);
            $t->string('default_seo_description', 500);
            $t->jsonb('social_links');
            $t->timestampsTz();
        });
        Schema::create('inquiries', function (Blueprint $t) {
            $t->id();
            $t->string('name', 120);
            $t->string('email', 254);
            $t->string('subject', 180);
            $t->text('message');
            $t->string('status', 20)->default('new')->index();
            $t->text('internal_note')->nullable();
            $t->timestampTz('submitted_at')->index();
            $t->timestampTz('last_status_changed_at')->nullable();
            $t->timestampsTz();
        });
        Schema::create('analytics_daily_counts', function (Blueprint $t) {
            $t->id();
            $t->date('date')->index();
            $t->string('aggregate_key', 64)->unique();
            $t->string('event_name', 30);
            $t->string('path', 255);
            $t->foreignId('entry_id')->nullable()->constrained('portfolio_entries')->nullOnDelete();
            $t->string('referrer_host', 253)->nullable();
            $t->bigInteger('count')->default(0);
            $t->timestampsTz();
            $t->index(['date', 'event_name']);
        });
        Schema::create('audit_events', function (Blueprint $t) {
            $t->id();
            $t->foreignId('actor_id')->nullable()->constrained('users')->nullOnDelete();
            $t->string('action', 80)->index();
            $t->string('entity_type', 80)->index();
            $t->unsignedBigInteger('entity_id');
            $t->jsonb('summary');
            $t->timestampTz('created_at')->index();
        });
        foreach ([
            ['portfolio_entries', 'kind', ['project', 'product']], ['portfolio_entries', 'status', ['draft', 'published', 'archived']],
            ['media', 'status', ['processing', 'ready', 'failed', 'deleting']], ['inquiries', 'status', ['new', 'read', 'replied', 'archived']],
            ['site_settings', 'availability', ['available', 'limited', 'unavailable']], ['analytics_daily_counts', 'event_name', ['page_view', 'entry_view', 'contact_click']],
        ] as [$table,$column,$values]) {
            $list = implode(',', array_map(fn ($v) => "'".$v."'", $values));
            DB::statement("ALTER TABLE $table ADD CONSTRAINT {$table}_{$column}_check CHECK ($column IN ($list))");
        }
        DB::statement('ALTER TABLE site_settings ADD CONSTRAINT settings_singleton CHECK (id = 1)');
        DB::statement("ALTER TABLE portfolio_entries ADD CONSTRAINT published_fields CHECK (status <> 'published' OR (published_at IS NOT NULL AND cover_media_id IS NOT NULL))");
        DB::statement('ALTER TABLE team_members ADD CONSTRAINT active_photo CHECK (NOT is_active OR photo_media_id IS NOT NULL)');
        DB::statement('ALTER TABLE media ADD CONSTRAINT media_bounds CHECK (bytes > 0 AND bytes <= 10485760 AND width > 0 AND height > 0 AND width <= 8000 AND height <= 8000 AND width::bigint * height <= 20000000)');
        DB::statement('ALTER TABLE analytics_daily_counts ADD CONSTRAINT analytics_positive CHECK (count >= 0)');
    }

    public function down(): void
    {
        foreach (['audit_events', 'analytics_daily_counts', 'inquiries', 'site_settings', 'services', 'entry_media', 'entry_contributor', 'entry_technology', 'portfolio_entries', 'team_member_links', 'team_members', 'technologies', 'categories', 'media'] as $table) {
            Schema::dropIfExists($table);
        }
    }
};
