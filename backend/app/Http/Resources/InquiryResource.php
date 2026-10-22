<?php

namespace App\Http\Resources;

use App\Models\Inquiry;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

/** @mixin Inquiry */
class InquiryResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return ['id' => $this->id, 'name' => $this->name, 'email' => $this->email, 'subject' => $this->subject, 'message' => $this->message, 'status' => $this->status, 'internal_note' => $this->internal_note, 'submitted_at' => $this->submitted_at->toISOString(), 'last_status_changed_at' => $this->last_status_changed_at?->toISOString(), 'created_at' => $this->created_at->toISOString(), 'updated_at' => $this->updated_at->toISOString()];
    }
}
