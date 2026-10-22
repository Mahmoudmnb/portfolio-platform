<?php

namespace App\Http\Controllers;

use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class ReadinessController extends Controller
{
    public function __invoke(): JsonResponse
    {
        $path = 'health/'.Str::uuid();
        try {
            DB::select('SELECT 1');
            $local = Storage::disk('local');
            if (! $local->put($path, 'ok') || ! $local->delete($path)) {
                throw new \RuntimeException;
            }
            $disk = Storage::disk(config('portfolio.media_disk'));
            if (! $disk->put($path, 'ok') || ! $disk->delete($path)) {
                throw new \RuntimeException;
            }
        } catch (\Throwable $e) {
            return response()->json(['message' => 'Service unavailable.', 'code' => 'UNAVAILABLE', 'errors' => (object) [], 'request_id' => request()->attributes->get('request_id')], 503);
        }

        return response()->json(['data' => ['ready' => true]]);
    }
}
