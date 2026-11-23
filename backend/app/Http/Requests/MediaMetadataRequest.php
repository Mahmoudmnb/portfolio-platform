<?php

namespace App\Http\Requests;

class MediaMetadataRequest extends StrictRequest
{
    public function rules(): array
    {
        return ['alt_text' => ['present', 'nullable', 'string', 'max:500']];
    }
}
