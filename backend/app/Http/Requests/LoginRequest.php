<?php

namespace App\Http\Requests;

class LoginRequest extends StrictRequest
{
    public function rules(): array
    {
        return ['email' => ['required', 'email', 'max:254'], 'password' => ['required', 'string', 'max:1024'], 'device_name' => ['required', 'string', 'max:120']];
    }
}
