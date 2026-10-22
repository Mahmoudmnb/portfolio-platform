<?php

namespace App\Http\Requests;

use App\Enums\InquiryStatus;
use Illuminate\Validation\Rule;

class InquiryUpdateRequest extends StrictRequest
{
    public function rules(): array
    {
        return ['status' => ['sometimes', Rule::enum(InquiryStatus::class)], 'internal_note' => 'sometimes|nullable|string|max:5000'];
    }
}
