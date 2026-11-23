<?php

namespace App\Http\Requests;

class InquiryRequest extends StrictRequest
{
    public function rules(): array
    {
        return ['name' => 'required|string|max:120', 'email' => 'required|email|max:254', 'subject' => 'required|string|max:180', 'message' => 'required|string|max:10000', 'source_page' => ['sometimes', 'nullable', 'string', 'max:255', 'regex:~^/(?!/)[a-zA-Z0-9/_-]*$~D'], 'website' => 'sometimes|nullable|string|max:2048'];
    }
}
