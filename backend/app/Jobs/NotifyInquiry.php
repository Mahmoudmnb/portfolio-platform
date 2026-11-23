<?php

namespace App\Jobs;

use App\Models\Inquiry;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Queue\Queueable;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;

class NotifyInquiry implements ShouldQueue
{
    use Queueable;

    public int $tries = 3;

    public int $timeout = 30;

    public function __construct(public int $inquiryId) {}

    public function backoff(): array
    {
        return [30, 120, 300];
    }

    public function handle(): void
    {
        DB::transaction(function () {
            $inquiry = Inquiry::whereKey($this->inquiryId)->lockForUpdate()->first();
            $recipient = config('portfolio.inquiry_notification_email');
            if (! $inquiry || $inquiry->notified_at || ! is_string($recipient) || ! filter_var($recipient, FILTER_VALIDATE_EMAIL)) {
                return;
            }
            Mail::raw('A new website inquiry is available in the administrator application. Sign in to review it.', function ($message) use ($recipient) {
                $message->to($recipient)->subject('New website inquiry');
            });
            $inquiry->update(['notified_at' => now()]);
        });
    }
}
