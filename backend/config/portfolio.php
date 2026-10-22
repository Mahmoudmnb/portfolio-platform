<?php

return [
    'media_disk' => env('MEDIA_DISK', 'public'),
    'analytics_enabled' => (bool) env('ANALYTICS_ENABLED', true),
    'referrer_daily_limit' => (int) env('ANALYTICS_REFERRER_DAILY_LIMIT', 100),
    'analytics_retention_days' => (int) env('ANALYTICS_RETENTION_DAYS', 90),
    'inquiry_retention_days' => (int) env('INQUIRY_RETENTION_DAYS', 180),
    'audit_retention_days' => (int) env('AUDIT_RETENTION_DAYS', 180),
    'site_origins' => array_filter(explode(',', env('SITE_ORIGINS', 'http://localhost:8080'))),
    'limits' => ['login_account' => (int) env('LIMIT_LOGIN_ACCOUNT', 5), 'login_ip' => (int) env('LIMIT_LOGIN_IP', 30), 'reads' => (int) env('LIMIT_READS', 120), 'inquiries' => (int) env('LIMIT_INQUIRIES', 3), 'analytics' => (int) env('LIMIT_ANALYTICS', 60), 'uploads' => (int) env('LIMIT_UPLOADS', 20), 'mutations' => (int) env('LIMIT_MUTATIONS', 120)],
];
