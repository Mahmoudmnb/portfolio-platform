<?php

namespace App\Http\Requests;

class UploadRequest extends StrictRequest
{
    public function rules(): array
    {
        return ['alt_text' => ['sometimes', 'nullable', 'string', 'max:500'], 'file' => ['required', 'file', 'max:10240']];
    }
}
