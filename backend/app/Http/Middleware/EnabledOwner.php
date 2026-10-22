<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Gate;
use Symfony\Component\HttpFoundation\Response;

class EnabledOwner
{
    public function handle(Request $request, Closure $next): Response
    {
        abort_unless($request->user()?->enabled, 403, 'Owner access is disabled.');
        Gate::authorize('manage-backend');

        return $next($request);
    }
}
