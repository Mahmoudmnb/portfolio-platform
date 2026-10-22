<?php

namespace App\Console\Commands;

use App\Models\Category;
use App\Models\PortfolioEntry;
use App\Models\Service;
use App\Models\Technology;
use Illuminate\Console\Command;

class DemoContent extends Command
{
    protected $signature = 'app:demo';

    protected $description = 'Create deterministic fictional draft content outside production.';

    public function handle(): int
    {
        if (app()->environment('production')) {
            $this->error('Demo data is disabled in production.');

            return self::FAILURE;
        }
        $c = Category::firstOrCreate(['slug' => 'fictional-mobile'], ['name' => 'Fictional mobile', 'sort_order' => 0]);
        $t = Technology::firstOrCreate(['slug' => 'flutter'], ['name' => 'Flutter', 'website_url' => 'https://flutter.dev']);
        $entry = PortfolioEntry::firstOrCreate(['slug' => 'fictional-field-notes'], ['title' => 'Fictional field notes', 'summary' => 'An offline notebook demonstration.', 'description' => 'A fictional project for local integration.', 'kind' => 'project', 'category_id' => $c->id, 'status' => 'draft']);
        $entry->technologies()->syncWithoutDetaching([$t->id]);
        Service::firstOrCreate(['slug' => 'fictional-app-development'], ['title' => 'Fictional application development', 'summary' => 'Example service.', 'description' => 'Fictional service for local testing.', 'is_active' => false]);
        $this->info('Fictional drafts created. No owner or password seeded.');

        return self::SUCCESS;
    }
}
