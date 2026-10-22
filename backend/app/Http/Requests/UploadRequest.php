<?php

namespace App\Http\Requests;

class UploadRequest extends StrictRequest
{
    public function rules(): array
    {
        return ['file' => ['required', 'file', 'max:10240']];
    }
}
