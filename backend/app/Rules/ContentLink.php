<?php

namespace App\Rules;

use Closure;
use Illuminate\Contracts\Validation\ValidationRule;

class ContentLink implements ValidationRule
{
    public function validate(string $attribute, mixed $value, Closure $fail): void
    {
        if (is_string($value) && preg_match('~^/(?!/)[a-zA-Z0-9/_-]*$~D', $value)) {
            return;
        }
        (new ContentUrl)->validate($attribute, $value, $fail);
    }
}
