<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\ValidationException;

abstract class StrictRequest extends FormRequest
{
    abstract public function rules(): array;

    public function authorize(): bool
    {
        return true;
    }

    protected function prepareForValidation(): void
    {
        $allowed = array_unique(array_map(fn ($key) => explode('.', $key)[0], array_keys($this->rules())));
        $unknown = array_diff(array_keys($this->all()), $allowed);
        if ($unknown) {
            throw ValidationException::withMessages(array_fill_keys($unknown, ['Unknown field.']));
        }
    }
}
