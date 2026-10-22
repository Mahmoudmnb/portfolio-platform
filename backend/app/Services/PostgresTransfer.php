<?php

namespace App\Services;

use Carbon\CarbonImmutable;
use Illuminate\Database\Connection;
use Illuminate\Support\Facades\DB;

class PostgresTransfer
{
    /** Parent tables precede dependents; migrations and ephemeral locks are never copied. */
    public const TABLES = ['users', 'media', 'categories', 'technologies', 'team_members', 'team_member_links', 'portfolio_entries', 'entry_technology', 'entry_contributor', 'entry_media', 'services', 'site_settings', 'inquiries', 'analytics_daily_counts', 'audit_events', 'personal_access_tokens', 'jobs', 'job_batches', 'failed_jobs', 'cache', 'cache_locks'];

    public function run(Connection $source, bool $apply = false, bool $verify = false): array
    {
        $target = DB::connection();
        if ($source->getDriverName() !== 'pgsql' || ! in_array($target->getDriverName(), ['mysql', 'mariadb'], true)) {
            throw new \RuntimeException('Transfer requires a PostgreSQL source and MySQL/MariaDB target.');
        }
        $source->beginTransaction();
        try {
            $source->statement('SET TRANSACTION ISOLATION LEVEL REPEATABLE READ READ ONLY');

            return $target->transaction(function () use ($source, $target, $apply, $verify) {
                if ($apply) {
                    $target->table('application_locks')->upsert([['name' => 'transfer']], ['name'], ['name']);
                    foreach (self::TABLES as $table) {
                        if ($target->table($table)->exists()) {
                            throw new \RuntimeException('Target must be newly migrated and empty; no records were overwritten.');
                        }
                    }
                }
                $report = [];
                foreach (self::TABLES as $table) {
                    $columns = array_values(array_filter($target->getSchemaBuilder()->getColumns($table), fn ($column) => ! ($column['generation'] ?? null)));
                    $names = array_column($columns, 'name');
                    $sourceDigest = hash_init('sha256');
                    $rows = 0;
                    $order = $target->getSchemaBuilder()->getIndexes($table);
                    $primary = collect($order)->firstWhere('primary', true)['columns'];
                    $query = $source->table($table)->select($names);
                    foreach ($primary as $key) {
                        $column = collect($columns)->firstWhere('name', $key);
                        if (in_array($column['type_name'], ['varchar', 'char'], true)) {
                            $query->orderByRaw('"'.$key.'" COLLATE "C"');
                        } else {
                            $query->orderBy($key);
                        }
                    }
                    $query->chunk(100, function ($chunk) use ($columns, $table, $target, $apply, &$rows, $sourceDigest) {
                        foreach ($chunk as $row) {
                            $data = $this->normalize((array) $row, $columns);
                            hash_update($sourceDigest, json_encode($data, JSON_THROW_ON_ERROR)."\n");
                            if ($apply) {
                                $target->table($table)->insert($data);
                            }
                            $rows++;
                        }
                    });
                    $expected = hash_final($sourceDigest);
                    $report[$table] = ['rows' => $rows, 'sha256' => $expected];
                    if ($apply || $verify) {
                        $digest = hash_init('sha256');
                        $actual = 0;
                        $query = $target->table($table)->select($names);
                        foreach ($primary as $key) {
                            $column = collect($columns)->firstWhere('name', $key);
                            if (in_array($column['type_name'], ['varchar', 'char'], true)) {
                                $query->orderByRaw('BINARY `'.$key.'`');
                            } else {
                                $query->orderBy($key);
                            }
                        }
                        $query->chunk(100, function ($chunk) use ($columns, &$actual, $digest) {
                            foreach ($chunk as $row) {
                                hash_update($digest, json_encode($this->normalize((array) $row, $columns), JSON_THROW_ON_ERROR)."\n");
                                $actual++;
                            }
                        });
                        if ($actual !== $rows || hash_final($digest) !== $expected) {
                            throw new \RuntimeException('Reconciliation failed for '.$table.'; transaction rolled back.');
                        }
                        $report[$table]['reconciled'] = true;
                    }
                }

                return $report;
            });
        } finally {
            $source->rollBack();
        }
    }

    private function normalize(array $row, array $columns): array
    {
        $data = [];
        foreach ($columns as $column) {
            $key = $column['name'];
            $value = $row[$key];
            if ($value !== null) {
                $type = $column['type_name'];
                if (in_array($type, ['tinyint', 'smallint', 'mediumint', 'int', 'bigint'], true)) {
                    $value = (int) $value;
                } elseif ($type === 'json' || $key === 'social_links' || ($key === 'summary' && $type === 'longtext')) {
                    $decoded = json_decode($value, flags: JSON_THROW_ON_ERROR);
                    $value = json_encode($this->canonical($decoded), JSON_THROW_ON_ERROR);
                } elseif (in_array($type, ['timestamp', 'datetime'], true)) {
                    $value = CarbonImmutable::parse($value, 'UTC')->utc()->format('Y-m-d H:i:s.u');
                } else {
                    $value = (string) $value;
                }
            }
            $data[$key] = $value;
        }

        return $data;
    }

    private function canonical(mixed $value): mixed
    {
        if ($value instanceof \stdClass) {
            $fields = get_object_vars($value);
            ksort($fields);

            return (object) array_map($this->canonical(...), $fields);
        }
        if (is_array($value)) {
            return array_map($this->canonical(...), $value);
        }

        return $value;
    }
}
