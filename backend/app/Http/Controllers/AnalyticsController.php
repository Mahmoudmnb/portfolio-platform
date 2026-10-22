<?php

namespace App\Http\Controllers;

use App\Http\Requests\EventRequest;
use App\Services\AnalyticsCounter;
use App\Support\Collections;
use Carbon\CarbonImmutable;
use Carbon\CarbonPeriod;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\ValidationException;

class AnalyticsController extends Controller
{
    public function store(EventRequest $r, AnalyticsCounter $counter): JsonResponse
    {
        $counter->increment($r->validated());

        return response()->json(['data' => ['accepted' => true]], 202);
    }

    public function report(Request $r, string $report): JsonResponse
    {
        $v = Collections::validate($r, ['start_date' => 'sometimes|date_format:Y-m-d', 'end_date' => 'sometimes|date_format:Y-m-d', 'limit' => 'sometimes|integer|between:1,50']);
        if ($r->hasAny(['page', 'per_page'])) {
            throw ValidationException::withMessages(['page' => ['Analytics reports use limit, not pagination.']]);
        }
        $end = isset($v['end_date']) ? CarbonImmutable::parse($v['end_date'], 'UTC') : CarbonImmutable::now('UTC')->startOfDay();
        $start = isset($v['start_date']) ? CarbonImmutable::parse($v['start_date'], 'UTC') : $end->subDays(29);
        if ($end->isFuture() || $start->greaterThan($end) || $start->diffInDays($end) > 89) {
            throw ValidationException::withMessages(['start_date' => ['Use an inclusive UTC range of at most 90 days, ending no later than today.']]);
        }
        $q = DB::table('analytics_daily_counts')->whereBetween('date', [$start->toDateString(), $end->toDateString()]);
        $data = [];
        if ($report === 'summary') {
            $totals = (clone $q)->selectRaw('event_name, SUM(count) AS total')->groupBy('event_name')->pluck('total', 'event_name');
            $data = ['page_view' => (int) ($totals['page_view'] ?? 0), 'entry_view' => (int) ($totals['entry_view'] ?? 0), 'contact_click' => (int) ($totals['contact_click'] ?? 0)];
        } elseif ($report === 'daily') {
            $rows = (clone $q)->selectRaw('date,event_name,SUM(count) AS total')->groupBy('date', 'event_name')->get()->groupBy('date');
            foreach (CarbonPeriod::create($start, $end)->toArray() as $day) {
                $key = $day->toDateString();
                $totals = ($rows[$key] ?? collect())->pluck('total', 'event_name');
                $data[] = ['date' => $key, 'page_view' => (int) ($totals['page_view'] ?? 0), 'entry_view' => (int) ($totals['entry_view'] ?? 0), 'contact_click' => (int) ($totals['contact_click'] ?? 0)];
            }
        } else {
            $column = match ($report) {
                'top-pages' => 'path','top-entries' => 'entry_id','referrers' => 'referrer_host', default => abort(404)
            };
            if ($report === 'top-pages') {
                $q->where('event_name', 'page_view');
            }
            if ($report === 'top-entries') {
                $q->where('event_name', 'entry_view');
            }
            $data = $q->select($column)->selectRaw('SUM(count) AS total')->groupBy($column)->orderByDesc('total')->orderBy($column)->limit($v['limit'] ?? 10)->get()->map(fn ($row) => [$column => $row->$column, 'total' => (int) $row->total]);
        }

        return response()->json(['data' => $data, 'meta' => ['start_date' => $start->toDateString(), 'end_date' => $end->toDateString(), 'retention_days' => config('portfolio.analytics_retention_days')]]);
    }
}
