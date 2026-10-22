<?php

namespace App\Rules;

use Closure;
use Illuminate\Contracts\Validation\ValidationRule;

class ContentUrl implements ValidationRule
{
    public function validate(string $attribute, mixed $value, Closure $fail): void
    {
        $p = is_string($value) ? parse_url($value) : false;
        if (! $p || ! filter_var($value, FILTER_VALIDATE_URL) || ! in_array(strtolower($p['scheme'] ?? ''), ['http', 'https'], true) || isset($p['user']) || isset($p['pass']) || preg_match('/[\x00-\x20\x7f]/', $value)) {
            $fail('Use an HTTP(S) URL without credentials.');
        }
    }
}
