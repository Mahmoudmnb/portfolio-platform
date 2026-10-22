<?php

namespace App\Services;

use App\Models\Category;
use App\Models\Media;
use App\Models\PortfolioEntry;
use App\Models\TeamMember;
use App\Models\Technology;
use App\Support\ApiException;
use App\Support\Audit;
use App\Support\ContentTypes;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\QueryException;
use Illuminate\Database\UniqueConstraintViolationException;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Illuminate\Validation\ValidationException;

class ContentWriter
{
    public function save(string $type, array $data, ?int $id = null): Model
    {
        $generated = $type !== 'site-settings' && ! $id && ! array_key_exists('slug', $data);
        $base = substr(Str::slug($data['title'] ?? $data['name'] ?? 'entry'), 0, 140) ?: 'entry';
        for ($attempt = 0; $attempt < 10; $attempt++) {
            $input = $data;
            if ($generated) {
                $input['slug'] = $base.($attempt ? '-'.Str::lower(Str::random(8)) : '');
            }
            try {
                return DB::transaction(function () use ($type, $input, $id) {
                    $class = ContentTypes::MODELS[$type];
                    $entity = $id ? $class::whereKey($id)->lockForUpdate()->firstOrFail() : new $class;
                    $relations = collect($input)->only(['technology_ids', 'contributor_ids', 'gallery', 'links'])->all();
                    $entity->fill(collect($input)->except(array_keys($relations))->all());
                    $mediaField = match ($type) {
                        'entries' => 'cover_media_id', 'team-members' => 'photo_media_id', 'site-settings' => 'logo_media_id', default => null
                    };
                    $mediaIds = $mediaField ? array_filter([$entity->getAttribute($mediaField)]) : [];
                    foreach ($relations['gallery'] ?? [] as $g) {
                        $mediaIds[] = $g['media_id'];
                    }
                    $mediaIds = array_values(array_unique($mediaIds));
                    sort($mediaIds);
                    $locked = Media::whereIn('id', $mediaIds)->orderBy('id')->lockForUpdate()->get();
                    if ($locked->count() !== count($mediaIds) || $locked->contains(fn ($m) => $m->status !== 'ready')) {
                        throw ValidationException::withMessages(['media' => ['All attached images must be ready.']]);
                    }
                    if ($entity instanceof PortfolioEntry && $entity->status === 'published') {
                        if (! $entity->cover_media_id) {
                            throw ValidationException::withMessages(['cover_media_id' => ['A ready cover is required to publish.']]);
                        }
                        $entity->published_at ??= now();
                        if ($entity->published_at->isFuture()) {
                            throw ValidationException::withMessages(['published_at' => ['Future publication is not supported.']]);
                        }
                    }
                    if ($entity instanceof TeamMember && $entity->is_active && ! $entity->photo_media_id) {
                        throw ValidationException::withMessages(['photo_media_id' => ['A ready photo is required to activate.']]);
                    }
                    $entity->save();
                    if ($entity instanceof PortfolioEntry && array_key_exists('technology_ids', $relations)) {
                        $entity->technologies()->sync($relations['technology_ids']);
                    }
                    if ($entity instanceof PortfolioEntry && array_key_exists('contributor_ids', $relations)) {
                        $entity->contributors()->sync($relations['contributor_ids']);
                    }
                    if ($entity instanceof PortfolioEntry && array_key_exists('gallery', $relations)) {
                        $entity->gallery()->sync(collect($relations['gallery'])->mapWithKeys(fn ($g) => [$g['media_id'] => ['alt_text' => $g['alt_text'], 'sort_order' => $g['sort_order'] ?? 0]])->all());
                    }
                    if ($entity instanceof TeamMember && array_key_exists('links', $relations)) {
                        $entity->links()->delete();
                        $entity->links()->createMany($relations['links']);
                    }
                    Audit::record($id ? 'updated' : 'created', $entity, array_keys($input));

                    return ContentTypes::query($type, true)->findOrFail($entity->id);
                }, 3);
            } catch (UniqueConstraintViolationException $e) {
                if ($generated) {
                    continue;
                }
                throw ValidationException::withMessages(['slug' => ['This slug is already in use.']]);
            } catch (QueryException $e) {
                if ($e->getCode() === '23503') {
                    throw ValidationException::withMessages(['relations' => ['A referenced item changed; refetch and retry.']]);
                }
                throw $e;
            }
        }
        throw new ApiException('Could not allocate a unique slug; retry.');
    }

    public function delete(string $type, int $id): void
    {
        DB::transaction(function () use ($type, $id) {
            $class = ContentTypes::MODELS[$type];
            $entity = $class::whereKey($id)->lockForUpdate()->firstOrFail();
            if ($entity instanceof PortfolioEntry && $entity->status === 'published') {
                throw new ApiException('Unpublish the entry before deleting it.');
            }
            if (($entity instanceof Category || $entity instanceof Technology) && $entity->entries()->exists()) {
                throw new ApiException('Detach referenced content before deletion.');
            }
            Audit::record('deleted', $entity);
            $entity->delete();
        });
    }
}
