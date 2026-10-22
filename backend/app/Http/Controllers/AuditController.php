<?php

namespace App\Http\Controllers;

use App\Http\Resources\AuditResource;
use App\Models\AuditEvent;
use App\Support\Collections;
use Carbon\CarbonImmutable;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\AnonymousResourceCollection;

class AuditController extends Controller
{
    public function index(Request $r): AnonymousResourceCollection
    {
        $v = Collections::validate($r, ['action' => 'sometimes|string|max:80', 'entity_type' => 'sometimes|string|max:80', 'start_date' => 'sometimes|date_format:Y-m-d', 'end_date' => 'sometimes|date_format:Y-m-d|after_or_equal:start_date']);
        $q = AuditEvent::query();
        foreach (['action', 'entity_type'] as $f) {
            if (isset($v[$f])) {
                $q->where($f, $v[$f]);
            }
        } if (isset($v['start_date'])) {
            $q->where('created_at', '>=', $v['start_date'].' 00:00:00+00');
        } if (isset($v['end_date'])) {
            $q->where('created_at', '<', CarbonImmutable::parse($v['end_date'], 'UTC')->addDay());
        }

        return AuditResource::collection($q->orderByDesc('id')->paginate($v['per_page'] ?? 20)->withQueryString());
    }
}
