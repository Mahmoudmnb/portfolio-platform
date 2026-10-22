<?php

use App\Http\Middleware\ApiContext;
use App\Http\Middleware\EnabledOwner;
use Illuminate\Auth\Access\AuthorizationException;
use Illuminate\Auth\AuthenticationException;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Database\QueryException;
use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use Symfony\Component\HttpKernel\Exception\HttpExceptionInterface;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(web: __DIR__.'/../routes/web.php', api: __DIR__.'/../routes/api.php', commands: __DIR__.'/../routes/console.php', health: '/up')
    ->withMiddleware(function (Middleware $m): void {
        $m->prepend(ApiContext::class);
        $m->trimStrings(except: ['path', 'referrer']);
        $m->alias(['owner' => EnabledOwner::class]);
        if (env('TRUSTED_PROXIES')) {
            $m->trustProxies(at: array_filter(explode(',', env('TRUSTED_PROXIES'))), headers: Request::HEADER_X_FORWARDED_FOR | Request::HEADER_X_FORWARDED_PROTO | Request::HEADER_X_FORWARDED_PORT);
        }
    })
    ->withExceptions(function (Exceptions $e): void {
        $e->shouldRenderJsonWhen(fn (Request $r) => $r->is('api/*') || $r->expectsJson());
        $e->dontFlash(['password', 'password_confirmation', 'current_password', 'token', 'message', 'email']);
        // Never log exception payloads, SQL bindings, headers or contact content.
        $e->report(function (Throwable $error) {
            logger()->error('Application failure', ['exception_type' => get_class($error), 'request_id' => request()->attributes->get('request_id')]);

            return false;
        });
        $e->render(function (Throwable $error, Request $r) {
            if (! $r->is('api/*')) {
                return null;
            }
            $status = match (true) {
                $error instanceof ValidationException => 422,
                $error instanceof AuthenticationException => 401,
                $error instanceof AuthorizationException => 403,
                $error instanceof ModelNotFoundException => 404,
                $error instanceof HttpExceptionInterface => $error->getStatusCode(),
                $error instanceof QueryException && $error->getCode() === '23503' => 409,
                default => 500
            };
            $code = match ($status) {
                401 => 'UNAUTHENTICATED',403 => 'FORBIDDEN',404 => 'NOT_FOUND',405 => 'METHOD_NOT_ALLOWED',409 => 'CONFLICT',413 => 'PAYLOAD_TOO_LARGE',422 => 'VALIDATION_ERROR',429 => 'RATE_LIMITED',503 => 'UNAVAILABLE',default => 'INTERNAL_ERROR'
            };
            $message = match ($status) {
                401 => 'Invalid credentials or token.',403 => 'Owner access is forbidden.',404 => 'Resource not found.',405 => 'Method not allowed.',413 => 'Request body is too large.',422 => 'The given data was invalid.',429 => 'Too many requests.',500 => 'An internal error occurred.',503 => 'Service unavailable.',default => $status < 500 ? $error->getMessage() : 'An internal error occurred.'
            };
            $headers = $error instanceof HttpExceptionInterface ? $error->getHeaders() : [];
            $headers['X-Request-ID'] = $r->attributes->get('request_id');
            $headers['Cache-Control'] = 'no-store';

            return response()->json(['message' => $message, 'code' => $code, 'errors' => $error instanceof ValidationException ? (object) $error->errors() : (object) [], 'request_id' => $r->attributes->get('request_id')], $status, $headers);
        });
    })->create();
