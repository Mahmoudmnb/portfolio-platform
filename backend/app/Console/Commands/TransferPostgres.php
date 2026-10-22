<?php

namespace App\Console\Commands;

use App\Services\PostgresTransfer;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;

class TransferPostgres extends Command
{
    protected $signature = 'app:transfer-postgres {--apply : Copy into an empty target} {--verify : Reconcile an existing target} {--confirm-target= : Exact destination database name required for apply}';

    protected $description = 'Read-only PostgreSQL inventory by default; optionally copy/reconcile into MySQL.';

    public function handle(PostgresTransfer $transfer): int
    {
        if ($this->option('apply') && ($this->option('verify') || $this->option('confirm-target') !== DB::connection()->getDatabaseName())) {
            $this->error('Apply requires the exact --confirm-target database and cannot be combined with --verify.');

            return self::FAILURE;
        }
        try {
            $report = $transfer->run(DB::connection('legacy_pgsql'), (bool) $this->option('apply'), (bool) $this->option('verify'));
            $this->line(json_encode($report, JSON_PRETTY_PRINT | JSON_THROW_ON_ERROR));
        } catch (\Throwable) {
            $this->error('Transfer failed; no source writes. Target transaction rolled back. Check configuration/schema/data privately; payloads and credentials are not logged.');

            return self::FAILURE;
        }

        return self::SUCCESS;
    }
}
