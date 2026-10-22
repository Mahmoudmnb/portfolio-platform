<?php

namespace App\Console\Commands;

use App\Models\User;
use App\Rules\PasswordBytes;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rules\Password;

class RecoverOwner extends Command
{
    protected $signature = 'app:recover-owner {--disable : Disable owner and revoke tokens} {--revoke : Revoke tokens only}';

    protected $description = 'Recover owner access interactively; never accepts a password argument.';

    public function handle(): int
    {
        if (! User::exists()) {
            $this->error('No owner exists.');

            return self::FAILURE;
        }
        $data = [];
        if (! $this->option('disable') && ! $this->option('revoke')) {
            $data = ['password' => $this->secret('New password'), 'password_confirmation' => $this->secret('Confirm password')];
            $v = Validator::make($data, ['password' => ['required', 'confirmed', Password::min(12)->mixedCase()->numbers(), new PasswordBytes]]);
            if ($v->fails()) {
                $this->error(implode(' ', $v->errors()->all()));

                return self::FAILURE;
            }
        }
        DB::transaction(function () use ($data) {
            $u = User::query()->lockForUpdate()->firstOrFail();
            $u->tokens()->delete();
            if ($this->option('disable')) {
                $u->update(['enabled' => false]);
            } elseif ($data) {
                $u->update(['enabled' => true, 'password' => $data['password']]);
            }
        });
        $this->info('Owner access updated; tokens revoked.');

        return self::SUCCESS;
    }
}
