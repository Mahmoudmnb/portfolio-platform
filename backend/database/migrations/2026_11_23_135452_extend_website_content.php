<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('media', function (Blueprint $table) {
            $table->string('alt_text', 500)->nullable();
            $table->unsignedBigInteger('display_bytes')->nullable();
        });
        Schema::table('portfolio_entries', function (Blueprint $table) {
            $table->string('project_type', 30)->nullable();
            $table->text('challenge')->nullable();
            $table->text('solution')->nullable();
            $table->json('outcomes')->nullable();
            $table->json('platforms')->nullable();
            $table->json('store_links')->nullable();
            $table->string('seo_title', 180)->nullable();
            $table->string('seo_description', 500)->nullable();
        });
        Schema::table('site_settings', function (Blueprint $table) {
            foreach (['phone', 'location', 'availability_text'] as $field) {
                $table->string($field, 255)->nullable();
            }
            foreach (['logo_light_media_id', 'logo_dark_media_id', 'favicon_media_id'] as $field) {
                $table->foreignId($field)->nullable()->constrained('media')->restrictOnDelete();
            }
            foreach (['navigation', 'footer', 'shared_cta', 'legal_links'] as $field) {
                $table->json($field)->nullable();
            }
        });
        Schema::table('services', function (Blueprint $table) {
            $table->json('features')->nullable();
            $table->foreignId('cover_media_id')->nullable()->constrained('media')->restrictOnDelete();
            $table->string('cta_label', 80)->nullable();
            $table->string('cta_url', 2048)->nullable();
            $table->string('seo_title', 180)->nullable();
            $table->string('seo_description', 500)->nullable();
        });
        Schema::table('team_member_links', function (Blueprint $table) {
            $table->boolean('is_visible')->default(true);
        });
        Schema::table('inquiries', function (Blueprint $table) {
            $table->string('source_page', 255)->nullable();
            $table->dateTime('notified_at', 6)->nullable();
        });
        Schema::create('pages', function (Blueprint $table) {
            $table->id();
            $table->string('page_key', 30)->unique();
            $table->string('status', 20)->default('draft');
            $table->json('content');
            $table->json('seo');
            $table->foreignId('og_image_media_id')->nullable()->constrained('media')->restrictOnDelete();
            $table->dateTime('created_at', 6)->nullable();
            $table->dateTime('updated_at', 6)->nullable();
        });
        Schema::create('page_entry', function (Blueprint $table) {
            $table->foreignId('page_id')->constrained()->cascadeOnDelete();
            $table->foreignId('entry_id')->constrained('portfolio_entries')->cascadeOnDelete();
            $table->integer('sort_order')->default(0);
            $table->primary(['page_id', 'entry_id']);
        });
        DB::statement("ALTER TABLE pages ADD CONSTRAINT pages_status_check CHECK (status IN ('draft','published'))");
        DB::statement("ALTER TABLE pages ADD CONSTRAINT pages_key_check CHECK (page_key IN ('home','about','services','projects','contact'))");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('media', fn (Blueprint $table) => $table->dropColumn(['alt_text', 'display_bytes']));
        Schema::dropIfExists('page_entry');
        Schema::dropIfExists('pages');
        Schema::table('inquiries', fn (Blueprint $table) => $table->dropColumn(['source_page', 'notified_at']));
        Schema::table('team_member_links', fn (Blueprint $table) => $table->dropColumn('is_visible'));
        Schema::table('services', function (Blueprint $table) {
            $table->dropConstrainedForeignId('cover_media_id');
            $table->dropColumn(['features', 'cta_label', 'cta_url', 'seo_title', 'seo_description']);
        });
        Schema::table('site_settings', function (Blueprint $table) {
            foreach (['logo_light_media_id', 'logo_dark_media_id', 'favicon_media_id'] as $field) {
                $table->dropConstrainedForeignId($field);
            }
            $table->dropColumn(['phone', 'location', 'availability_text', 'navigation', 'footer', 'shared_cta', 'legal_links']);
        });
        Schema::table('portfolio_entries', fn (Blueprint $table) => $table->dropColumn(['project_type', 'challenge', 'solution', 'outcomes', 'platforms', 'store_links', 'seo_title', 'seo_description']));
    }
};
