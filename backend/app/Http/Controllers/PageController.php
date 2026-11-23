<?php

namespace App\Http\Controllers;

use App\Http\Requests\PageRequest;
use App\Http\Resources\PageResource;
use App\Models\Media;
use App\Models\Page;
use App\Support\Audit;
use App\Support\ContentTypes;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\AnonymousResourceCollection;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\ValidationException;

class PageController extends Controller
{
    private function query(bool $admin): Builder
    {
        return Page::with(['ogImage' => fn ($query) => $query->withUsage(), 'featuredEntries' => fn ($query) => $query->when(! $admin, fn ($query) => $query->visible())->with(ContentTypes::query('entries', $admin)->getEagerLoads())]);
    }

    public function index(): AnonymousResourceCollection
    {
        return PageResource::collection($this->query(true)->orderBy('page_key')->get());
    }

    public function show(Request $request, string $page_key): PageResource
    {
        $admin = $request->is('api/v1/admin/*');

        return new PageResource($this->query($admin)->when(! $admin, fn ($query) => $query->where('status', 'published'))->where('page_key', $page_key)->firstOrFail());
    }

    public function update(PageRequest $request, string $page_key): PageResource
    {
        return DB::transaction(function () use ($request, $page_key) {
            $lock = 'page:'.$page_key;
            DB::table('application_locks')->insertOrIgnore(['name' => $lock]);
            DB::table('application_locks')->where('name', $lock)->lockForUpdate()->first();
            $page = Page::where('page_key', $page_key)->lockForUpdate()->first() ?? new Page(['page_key' => $page_key]);
            $data = $request->validated();
            $page->fill(collect($data)->except('featured_entry_ids')->all());
            if ($page->og_image_media_id) {
                $image = Media::whereKey($page->og_image_media_id)->lockForUpdate()->first();
                if (! $image || $image->status !== 'ready') {
                    throw ValidationException::withMessages(['og_image_media_id' => ['The image must be ready.']]);
                }
            }
            $page->save();
            if (array_key_exists('featured_entry_ids', $data)) {
                $page->featuredEntries()->sync(collect($data['featured_entry_ids'])->mapWithKeys(fn ($id, $index) => [$id => ['sort_order' => $index]])->all());
            }
            Audit::record('updated', $page, array_keys($data));

            return new PageResource($this->query(true)->findOrFail($page->id));
        }, 3);
    }
}
