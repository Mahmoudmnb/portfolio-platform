<?php

namespace App\Console\Commands;

use App\Models\User;
use App\Rules\PasswordBytes;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rules\Password;

class CreateOwner extends Command
{
    protected $signature = 'app:create-owner';

    protected $description = 'Interactively create the single owner (no default password).';

    public function handle(): int
    {
        if (User::exists()) {
            $this->error('An owner already exists. Use app:recover-owner.');

            return self::FAILURE;
        }
        $data = ['name' => $this->ask('Name'), 'email' => mb_strtolower(trim((string) $this->ask('Email'))), 'password' => $this->secret('Password (12+ characters, mixed case and numbers)'), 'password_confirmation' => $this->secret('Confirm password')];
        $v = Validator::make($data, ['name' => 'required|string|max:120', 'email' => 'required|email|max:254', 'password' => ['required', 'confirmed', Password::min(12)->mixedCase()->numbers(), new PasswordBytes]]);
        if ($v->fails()) {
            $this->error(implode(' ', $v->errors()->all()));

            return self::FAILURE;
        }
        DB::transaction(function () use ($data) {
            DB::table('application_locks')->upsert([['name' => 'owner']], ['name'], ['name']);
            if (User::exists()) {
                throw new \RuntimeException('An owner already exists.');
            } User::create(collect($data)->except('password_confirmation')->all());
        });
        $this->info('Owner created.');

        return self::SUCCESS;
    }
}
