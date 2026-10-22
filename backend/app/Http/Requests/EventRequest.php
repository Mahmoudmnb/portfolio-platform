<?php

namespace App\Http\Requests;

use App\Enums\EventName;
use App\Models\PortfolioEntry;
use App\Rules\ContentUrl;
use Illuminate\Validation\Rule;

class EventRequest extends StrictRequest
{
    public function rules(): array
    {
        return ['event_name' => ['required', Rule::enum(EventName::class)], 'path' => ['required', 'string', 'max:255', 'regex:~^(?:/|/(?:entries/[a-z0-9]+(?:-[a-z0-9]+)*|team(?:/[a-z0-9]+(?:-[a-z0-9]+)*)?|services(?:/[a-z0-9]+(?:-[a-z0-9]+)*)?|projects|products|about|contact)/?)$~D'], 'entry_id' => 'required_if:event_name,entry_view|prohibited_unless:event_name,entry_view|integer', 'referrer' => ['sometimes', 'nullable', 'string', 'max:2048', new ContentUrl]];
    }

    public function after(): array
    {
        return [function ($v) {
            if (! $v->errors()->has('entry_id') && $this->input('event_name') === 'entry_view' && ! PortfolioEntry::visible()->whereKey($this->input('entry_id'))->exists()) {
                $v->errors()->add('entry_id', 'A currently published entry is required.');
            }
        }];
    }
}
