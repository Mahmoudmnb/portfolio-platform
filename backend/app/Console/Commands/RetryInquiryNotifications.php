<?php

namespace App\Console\Commands;

use App\Jobs\NotifyInquiry;
use App\Models\Inquiry;
use Illuminate\Console\Command;

class RetryInquiryNotifications extends Command
{
    protected $signature = 'app:retry-inquiry-notification {id : The inquiry ID}';

    protected $description = 'Queue a generic notification for one stored, unnotified inquiry.';

    public function handle(): int
    {
        if (! filter_var(config('portfolio.inquiry_notification_email'), FILTER_VALIDATE_EMAIL)) {
            $this->error('Configure INQUIRY_NOTIFICATION_EMAIL before retrying.');

            return self::FAILURE;
        }
        $inquiry = Inquiry::find($this->argument('id'));
        if (! $inquiry || $inquiry->notified_at) {
            $this->error('The inquiry is missing or has already been notified.');

            return self::FAILURE;
        }
        NotifyInquiry::dispatch($inquiry->id)->afterCommit();
        $this->info('Notification queued.');

        return self::SUCCESS;
    }
}
