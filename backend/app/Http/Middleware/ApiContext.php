<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;
use Symfony\Component\HttpFoundation\Response;

class ApiContext
{
    public function handle(Request $request, Closure $next): Response
    {
        $id = (string) Str::uuid();
        $request->attributes->set('request_id', $id);
        Log::withContext(['request_id' => $id]);
        $request->headers->set('Accept', 'application/json');
        $response = $next($request);
        $response->headers->set('X-Request-ID', $id);
        $response->headers->set('Cache-Control', 'no-store');

        return $response;
    }
}
