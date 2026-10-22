<?php

use App\Http\Controllers\AnalyticsController;
use App\Http\Controllers\AuditController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\ContentController;
use App\Http\Controllers\InquiryController;
use App\Http\Controllers\MediaController;
use App\Http\Controllers\ReadinessController;
use Illuminate\Support\Facades\Route;

Route::prefix('v1')->group(function () {
    Route::get('ready', ReadinessController::class);
    Route::middleware('throttle:reads')->group(function () {
        foreach (['entries', 'categories', 'technologies', 'team-members', 'services'] as $resource) {
            Route::get($resource, [ContentController::class, 'index'])->defaults('resource', $resource);
            if (! in_array($resource, ['categories', 'technologies'])) {
                Route::get($resource.'/{slug}', [ContentController::class, 'show'])->defaults('resource', $resource);
            }
        }
        Route::get('site-settings', [ContentController::class, 'settings']);
    });
    Route::post('inquiries', [InquiryController::class, 'store'])->middleware('throttle:inquiries');
    Route::post('analytics/events', [AnalyticsController::class, 'store'])->middleware('throttle:analytics');
    Route::post('admin/auth/login', [AuthController::class, 'login'])->middleware('throttle:login');
    Route::prefix('admin')->middleware(['auth:sanctum', 'owner'])->group(function () {
        Route::get('auth/me', [AuthController::class, 'me']);
        Route::middleware('throttle:mutations')->group(function () {
            Route::post('auth/logout', [AuthController::class, 'logout']);
            Route::post('auth/logout-all', [AuthController::class, 'logoutAll']);
            Route::put('auth/password', [AuthController::class, 'password']);
            foreach (['entries', 'categories', 'technologies', 'team-members', 'services'] as $resource) {
                Route::get($resource, [ContentController::class, 'index'])->defaults('resource', $resource);
                Route::get($resource.'/{id}', [ContentController::class, 'show'])->whereNumber('id')->defaults('resource', $resource);
                Route::post($resource, [ContentController::class, 'store'])->defaults('resource', $resource);
                Route::patch($resource.'/{id}', [ContentController::class, 'update'])->whereNumber('id')->defaults('resource', $resource);
                Route::delete($resource.'/{id}', [ContentController::class, 'destroy'])->whereNumber('id')->defaults('resource', $resource);
            }
            Route::get('site-settings', [ContentController::class, 'settings']);
            Route::put('site-settings', [ContentController::class, 'updateSettings'])->defaults('resource', 'site-settings');
            Route::get('media', [MediaController::class, 'index']);
            Route::get('media/{id}', [MediaController::class, 'show'])->whereNumber('id');
            Route::delete('media/{id}', [MediaController::class, 'destroy'])->whereNumber('id');
            Route::get('inquiries', [InquiryController::class, 'index']);
            Route::get('inquiries/{id}', [InquiryController::class, 'show'])->whereNumber('id');
            Route::patch('inquiries/{id}', [InquiryController::class, 'update'])->whereNumber('id');
            Route::delete('inquiries/{id}', [InquiryController::class, 'destroy'])->whereNumber('id');
        });
        Route::post('media', [MediaController::class, 'store'])->middleware('throttle:uploads');
        foreach (['summary', 'daily', 'top-pages', 'top-entries', 'referrers'] as $report) {
            Route::get('analytics/'.$report, [AnalyticsController::class, 'report'])->defaults('report', $report);
        }
        Route::get('audit-events', [AuditController::class, 'index']);
    });
});
