<?php

namespace App\Providers;

use App\Policies\OwnerPolicy;
use Illuminate\Cache\RateLimiting\Limit;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\RateLimiter;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    public function register(): void {}

    public function boot(): void
    {
        Gate::define('manage-backend', [OwnerPolicy::class, 'manage']);
        $hash = fn (string $value) => hash_hmac('sha256', $value, (string) config('app.key'));
        RateLimiter::for('login', fn (Request $r) => [
            Limit::perMinute(config('portfolio.limits.login_account'))->by('account:'.$hash(mb_strtolower(trim(is_string($r->input('email')) ? $r->input('email') : '')).'|'.$r->ip())),
            Limit::perMinute(config('portfolio.limits.login_ip'))->by('ip:'.$hash((string) $r->ip())),
        ]);
        foreach (['reads', 'analytics'] as $name) {
            RateLimiter::for($name, fn (Request $r) => Limit::perMinute(config('portfolio.limits.'.$name))->by($hash((string) $r->ip())));
        }
        RateLimiter::for('inquiries', fn (Request $r) => Limit::perHour(config('portfolio.limits.inquiries'))->by($hash((string) $r->ip())));
        foreach (['uploads', 'mutations'] as $name) {
            RateLimiter::for($name, fn (Request $r) => Limit::perMinute(config('portfolio.limits.'.$name))->by((string) $r->user()->id));
        }
    }
}
