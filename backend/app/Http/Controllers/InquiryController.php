<?php

namespace App\Http\Controllers;

use App\Http\Requests\InquiryRequest;
use App\Http\Requests\InquiryUpdateRequest;
use App\Http\Resources\InquiryResource;
use App\Models\Inquiry;
use App\Support\Audit;
use App\Support\Collections;
use Carbon\CarbonImmutable;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\AnonymousResourceCollection;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\DB;

class InquiryController extends Controller
{
    public function store(InquiryRequest $r): JsonResponse
    {
        if (! $r->validated('website')) {
            Inquiry::create(collect($r->validated())->except('website')->all() + ['submitted_at' => now()]);
        }

        return response()->json(['data' => ['message' => 'Thank you. Your inquiry has been received.']], 201);
    }

    public function index(Request $r): AnonymousResourceCollection
    {
        $v = Collections::validate($r, ['status' => 'sometimes|in:new,read,replied,archived', 'start_date' => 'sometimes|date_format:Y-m-d', 'end_date' => 'sometimes|date_format:Y-m-d|after_or_equal:start_date']);
        $q = Inquiry::query();
        if (isset($v['status'])) {
            $q->where('status', $v['status']);
        } if (isset($v['start_date'])) {
            $q->where('submitted_at', '>=', $v['start_date'].' 00:00:00+00');
        } if (isset($v['end_date'])) {
            $q->where('submitted_at', '<', CarbonImmutable::parse($v['end_date'], 'UTC')->addDay());
        }

        return InquiryResource::collection($q->orderByDesc('submitted_at')->orderByDesc('id')->paginate($v['per_page'] ?? 20)->withQueryString());
    }

    public function show(int $id): InquiryResource
    {
        return new InquiryResource(Inquiry::findOrFail($id));
    }

    public function update(InquiryUpdateRequest $r, int $id): InquiryResource
    {
        return DB::transaction(function () use ($r, $id) {
            $i = Inquiry::whereKey($id)->lockForUpdate()->firstOrFail();
            $data = $r->validated();
            if (isset($data['status']) && $data['status'] !== $i->status) {
                $data['last_status_changed_at'] = now();
            } $i->update($data);
            Audit::record('updated', $i, array_keys($data));

            return new InquiryResource($i);
        });
    }

    public function destroy(int $id): Response
    {
        DB::transaction(function () use ($id) {
            $i = Inquiry::whereKey($id)->lockForUpdate()->firstOrFail();
            Audit::record('deleted', $i);
            $i->delete();
        });

        return response()->noContent();
    }
}
