<?php

namespace App\Http\Requests;

use App\Rules\PasswordBytes;
use Illuminate\Validation\Rules\Password;

class PasswordRequest extends StrictRequest
{
    public function rules(): array
    {
        return ['current_password' => ['required', 'string', 'current_password:sanctum'], 'password' => ['required', 'string', Password::min(12)->mixedCase()->numbers(), new PasswordBytes, 'confirmed', 'max:1024'], 'password_confirmation' => ['required', 'string']];
    }
}
