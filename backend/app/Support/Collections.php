<?php

namespace App\Support;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\ValidationException;

class Collections
{
    public static function validate(Request $r, array $rules = []): array
    {
        $rules = array_merge(['page' => 'sometimes|integer|min:1', 'per_page' => 'sometimes|integer|between:1,100'], $rules);
        $unknown = array_diff(array_keys($r->query()), array_keys($rules));
        if ($unknown) {
            throw ValidationException::withMessages(array_fill_keys($unknown, ['Unknown filter.']));
        }

        return Validator::make($r->query(), $rules)->validate();
    }

    public static function literal(string $value): string
    {
        return '%'.str_replace(['!', '%', '_'], ['!!', '!%', '!_'], $value).'%';
    }
}
