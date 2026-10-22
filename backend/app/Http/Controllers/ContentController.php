<?php

namespace App\Http\Controllers;

use App\Http\Requests\ContentRequest;
use App\Http\Resources\ContentResource;
use App\Services\ContentWriter;
use App\Support\Collections;
use App\Support\ContentTypes;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\AnonymousResourceCollection;
use Illuminate\Http\Response;
use Illuminate\Validation\ValidationException;

class ContentController extends Controller
{
    public function index(Request $r): AnonymousResourceCollection
    {
        $resource = $r->route('resource');
        $admin = $r->is('api/v1/admin/*');
        $rules = ['q' => 'sometimes|string|max:100'];
        if ($resource === 'entries') {
            $rules += ['kind' => 'sometimes|in:project,product', 'featured' => 'sometimes|boolean', 'category' => 'sometimes|string|max:160', 'technology' => 'sometimes|string|max:160'];
        }
        if ($admin && $resource === 'entries') {
            $rules += ['status' => 'sometimes|in:draft,published,archived'];
        }
        if ($admin && in_array($resource, ['team-members', 'services'])) {
            $rules += ['active' => 'sometimes|boolean'];
        }
        if ($admin) {
            $rules += ['sort' => 'sometimes|in:id,created_at,updated_at,sort_order', 'direction' => 'sometimes|in:asc,desc'];
        }
        $v = Collections::validate($r, $rules);
        $q = ContentTypes::query($resource, $admin);
        if (isset($v['sort']) && $v['sort'] === 'sort_order' && $resource === 'technologies') {
            throw ValidationException::withMessages(['sort' => ['Unsupported sort.']]);
        }
        foreach (['kind', 'status', 'featured'] as $f) {
            if (isset($v[$f])) {
                $q->where($f, $v[$f]);
            }
        }
        if (isset($v['active'])) {
            $q->where('is_active', $v['active']);
        }
        if (isset($v['category'])) {
            $q->whereHas('category', fn ($c) => $c->where('slug', $v['category']));
        }
        if (isset($v['technology'])) {
            $q->whereHas('technologies', fn ($c) => $c->where('slug', $v['technology']));
        }
        if (isset($v['q'])) {
            $pattern = Collections::literal($v['q']);
            $q->where(function ($q) use ($pattern, $resource) {
                if ($resource === 'entries') {
                    $q->whereRaw("LOWER(title) LIKE LOWER(?) COLLATE utf8mb4_bin ESCAPE '!'", [$pattern])->orWhereRaw("LOWER(summary) LIKE LOWER(?) COLLATE utf8mb4_bin ESCAPE '!'", [$pattern]);
                } else {
                    $column = $resource === 'services' ? 'title' : 'name';
                    $q->whereRaw("LOWER($column) LIKE LOWER(?) COLLATE utf8mb4_bin ESCAPE '!'", [$pattern]);
                }
            });
        }
        if ($admin && isset($v['sort'])) {
            $q->orderBy($v['sort'], $v['direction'] ?? 'asc');
        } elseif ($resource === 'entries') {
            $q->orderByDesc('featured')->orderBy('sort_order')->orderByDesc('published_at');
        } elseif ($resource !== 'technologies') {
            $q->orderBy('sort_order');
        }

        return ContentResource::collection($q->orderBy('id')->paginate($v['per_page'] ?? 20)->withQueryString());
    }

    public function show(Request $r): ContentResource
    {
        $resource = $r->route('resource');
        $id = $r->route('id');
        $slug = $r->route('slug');
        $q = ContentTypes::query($resource, $r->is('api/v1/admin/*'));

        return new ContentResource($id ? $q->findOrFail($id) : $q->where('slug', $slug)->firstOrFail());
    }

    public function store(ContentRequest $r, ContentWriter $writer): JsonResponse
    {
        return (new ContentResource($writer->save($r->route('resource'), $r->validated())))->response()->setStatusCode(201);
    }

    public function update(ContentRequest $r, ContentWriter $writer): ContentResource
    {
        return new ContentResource($writer->save($r->route('resource'), $r->validated(), (int) $r->route('id')));
    }

    public function destroy(Request $r, ContentWriter $writer): Response
    {
        $writer->delete($r->route('resource'), (int) $r->route('id'));

        return response()->noContent();
    }

    public function settings(): ContentResource
    {
        return new ContentResource(ContentTypes::query('site-settings', request()->is('api/v1/admin/*'))->findOrFail(1));
    }

    public function updateSettings(ContentRequest $r, ContentWriter $writer): ContentResource
    {
        return new ContentResource($writer->save('site-settings', $r->validated(), 1));
    }
}
