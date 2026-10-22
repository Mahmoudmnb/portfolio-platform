<?php

namespace App\Http\Controllers;

use App\Enums\MediaStatus;
use App\Http\Requests\UploadRequest;
use App\Http\Resources\MediaResource;
use App\Jobs\ProcessMedia;
use App\Models\Media;
use App\Services\ImageInspector;
use App\Services\MediaLifecycle;
use App\Support\Audit;
use App\Support\Collections;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\AnonymousResourceCollection;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Illuminate\Validation\Rule;

class MediaController extends Controller
{
    public function index(Request $r): AnonymousResourceCollection
    {
        $v = Collections::validate($r, ['state' => ['sometimes', Rule::enum(MediaStatus::class)], 'usage' => 'sometimes|in:used,unused']);
        $q = Media::withUsage();
        if (isset($v['state'])) {
            $q->where('status', $v['state']);
        }
        if (isset($v['usage'])) {
            $q->where(function ($q) use ($v) {
                if ($v['usage'] === 'used') {
                    $q->has('galleryEntries')->orHas('coverEntries')->orHas('members')->orHas('settings');
                } else {
                    $q->doesntHave('galleryEntries')->doesntHave('coverEntries')->doesntHave('members')->doesntHave('settings');
                }
            });
        }

        return MediaResource::collection($q->orderByDesc('id')->paginate($v['per_page'] ?? 20)->withQueryString());
    }

    public function show(int $id): MediaResource
    {
        return new MediaResource(Media::withUsage()->findOrFail($id));
    }

    public function store(UploadRequest $r, ImageInspector $inspector): JsonResponse
    {
        $file = $r->file('file');
        $info = $inspector->inspect($file->getRealPath());
        $key = (string) Str::uuid();
        Storage::disk('local')->putFileAs('uploads', $file, $key);
        try {
            $m = DB::transaction(function () use ($r, $file, $info, $key) {
                $m = Media::create($info + ['storage_key' => $key, 'disk' => config('portfolio.media_disk'), 'original_filename' => Str::limit(basename(str_replace('\\', '/', $file->getClientOriginalName())), 255, ''), 'uploader_id' => $r->user()->id, 'status' => 'processing']);
                Audit::record('uploaded', $m);

                return $m;
            });
        } catch (\Throwable $e) {
            Storage::disk('local')->delete('uploads/'.$key);
            throw $e;
        }
        try {
            ProcessMedia::dispatch($m->id)->afterCommit();
        } catch (\Throwable $e) {
            $m->update(['status' => 'failed']);
            Storage::disk('local')->delete('uploads/'.$key);
        }

        return (new MediaResource($m->refresh()))->response()->setStatusCode(201);
    }

    public function destroy(int $id, MediaLifecycle $lifecycle): Response
    {
        abort_unless(Media::whereKey($id)->exists(), 404);
        $lifecycle->delete($id);

        return response()->noContent();
    }
}
