import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_api/portfolio_api.dart';

import '../core/session.dart';
import '../core/ui.dart';

class RemoteCard extends StatefulWidget {
  final Future<Json> Function() fetch;
  final Widget Function(Json) render;
  final bool framed;
  const RemoteCard({
    super.key,
    required this.fetch,
    required this.render,
    this.framed = true,
  });
  @override
  State<RemoteCard> createState() => _RemoteCardState();
}

class _RemoteCardState extends State<RemoteCard> {
  late Future<Json> data;
  @override
  void initState() {
    super.initState();
    data = widget.fetch();
  }

  @override
  Widget build(BuildContext context) => FutureBuilder<Json>(
    future: data,
    builder: (c, s) => s.hasError
        ? ErrorPanel(
            s.error!,
            retry: () => setState(() => data = widget.fetch()),
          )
        : !s.hasData
        ? const Card(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: LinearProgressIndicator(),
            ),
          )
        : widget.framed
        ? Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: widget.render(s.data!),
            ),
          )
        : widget.render(s.data!),
  );
}

class OverviewScreen extends ConsumerStatefulWidget {
  const OverviewScreen({super.key});
  @override
  ConsumerState<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends ConsumerState<OverviewScreen> {
  int refresh = 0;
  late OwnerSession session;
  int revision = 0;
  @override
  void initState() {
    super.initState();
    session = ref.read(sessionProvider);
    revision = session.revision;
    session.addListener(invalidate);
  }

  void invalidate() {
    if (mounted && revision != session.revision) {
      revision = session.revision;
      setState(() => refresh++);
    }
  }

  @override
  void dispose() {
    session.removeListener(invalidate);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final api = ref.read(apiProvider);
    final range = UtcDateRange.recent();
    return Scaffold(
      body: SafeArea(
        child: PageBody(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: StudioHeading(
                    eyebrow: 'BANNAN / STUDIO',
                    title: 'Studio overview',
                  ),
                ),
                IconButton(
                  tooltip: 'Refresh overview',
                  onPressed: () => setState(() => refresh++),
                  icon: const Icon(Icons.refresh),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerLeft,
              child: StatusBadge('Last 30 days · UTC'),
            ),
            const SizedBox(height: 8),
            Text(
              range.toString(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 16),
            RemoteCard(
              key: ValueKey('summary$refresh'),
              fetch: () =>
                  api.get('admin/analytics/summary', query: range.query),
              render: (j) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your work is getting seen',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Accepted events',
                    style: TextStyle(color: Color(0xFF5D706C)),
                  ),
                  const SizedBox(height: 8),
                  totals(j['data'] as Map),
                ],
              ),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () async {
                await context.push('/entries/new');
                if (mounted) setState(() => refresh++);
              },
              child: const Text('Create a project'),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Keep things moving',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    for (final r in [Resource.entries, Resource.inquiries])
                      RemoteCard(
                        key: ValueKey('${r.name}$refresh'),
                        framed: false,
                        fetch: () => api.get(
                          r.route,
                          query: {
                            'status': r == Resource.entries ? 'draft' : 'new',
                            'per_page': 1,
                          },
                        ),
                        render: (j) => Semantics(
                          key: ValueKey('count-${r.name}'),
                          label:
                              '${(j['meta'] as Map)['total']} ${r == Resource.entries ? 'draft entries' : 'new inquiries'}',
                          child: ExcludeSemantics(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      r == Resource.entries
                                          ? 'Draft entries'
                                          : 'New inquiries',
                                      style: const TextStyle(
                                        color: Color(0xFF5D706C),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '${(j['meta'] as Map)['total']}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Recently updated',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            RemoteCard(
              key: ValueKey('recent$refresh'),
              fetch: () => api.get(
                'admin/entries',
                query: {
                  'sort': 'updated_at',
                  'direction': 'desc',
                  'per_page': 3,
                },
              ),
              render: (j) => Column(
                children: [
                  if ((j['data'] as List).isEmpty)
                    const Text('Create your first project.'),
                  for (final item in j['data'] as List)
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text('${item['title']}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${item['summary']}'),
                          const SizedBox(height: 8),
                          StatusBadge('${item['status']}'),
                          const SizedBox(height: 8),
                          Text(
                            '${label(item['kind'] as String? ?? 'entry')} · ${localTime(item['updated_at'])}',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                      onTap: () async {
                        await context.push('/entries/${item['id']}');
                        if (mounted) setState(() => refresh++);
                      },
                    ),
                ],
              ),
            ),
            for (final draft in session.drafts.keys.toList())
              OutlinedButton(
                onPressed: () => context.push(
                  draft.startsWith('site-settings')
                      ? '/site-settings'
                      : '/$draft',
                ),
                child: Text('Review unsaved ${draft.split('/').first}'),
              ),
          ],
        ),
      ),
    );
  }
}

Widget totals(Map data) => Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    for (final e in {
      'page_view': 'Page views',
      'entry_view': 'Entry views',
      'contact_click': 'Contact clicks',
    }.entries)
      Semantics(
        key: ValueKey('total-${e.key}'),
        label: '${e.value}: ${data[e.key]}',
        child: ExcludeSemantics(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    e.value,
                    style: const TextStyle(color: Color(0xFF5D706C)),
                  ),
                ),
                Text(
                  '${data[e.key]}',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ),
  ],
);

class AnalyticsScreen extends ConsumerStatefulWidget {
  const AnalyticsScreen({super.key});
  @override
  ConsumerState<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends ConsumerState<AnalyticsScreen> {
  UtcDateRange range = UtcDateRange.recent();
  String event = 'page_view';
  int refresh = 0;
  Future<void> choose() async {
    final now = DateTime.now().toUtc();
    final selected = await showDateRangePicker(
      context: context,
      firstDate: DateTime.utc(now.year - 2),
      lastDate: DateTime.utc(now.year, now.month, now.day),
      initialDateRange: DateTimeRange(start: range.start, end: range.end),
    );
    if (selected == null || !mounted) return;
    try {
      setState(() {
        range = UtcDateRange(selected.start, selected.end);
        refresh++;
      });
    } catch (e) {
      notice(context, 'Choose 1–90 inclusive UTC days, with no future dates.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final api = ref.read(apiProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Analytics')),
      body: SafeArea(
        child: PageBody(
          children: [
            OutlinedButton.icon(
              onPressed: choose,
              icon: const Icon(Icons.date_range),
              label: Text(range.toString()),
            ),
            const Text(
              'Accepted events may include retries and bots. Counts are not unique visitors.',
            ),
            const SizedBox(height: 16),
            for (final report in [
              'summary',
              'daily',
              'top-pages',
              'top-entries',
              'referrers',
            ]) ...[
              const SizedBox(height: 24),
              Text(
                label(report),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              if (report == 'daily')
                DropdownButtonFormField<String>(
                  initialValue: event,
                  isExpanded: true,
                  decoration: const InputDecoration(
                    labelText: 'Selected event',
                  ),
                  items: [
                    for (final e in [
                      'page_view',
                      'entry_view',
                      'contact_click',
                    ])
                      DropdownMenuItem(value: e, child: Text(label(e))),
                  ],
                  onChanged: (v) {
                    if (v != null) setState(() => event = v);
                  },
                ),
              RemoteCard(
                key: ValueKey('$report$refresh$event'),
                fetch: () => api.get(
                  'admin/analytics/$report',
                  query: {...range.query, 'limit': 10},
                ),
                render: (j) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Retention: ${(j['meta'] as Map)['retention_days']} days · UTC',
                    ),
                    if (report == 'summary')
                      totals(j['data'] as Map)
                    else if (report == 'daily')
                      daily((j['data'] as List).cast<Map>())
                    else ...[
                      if ((j['data'] as List).isEmpty)
                        const Padding(
                          padding: EdgeInsets.all(16),
                          child: Text('No events in this range.'),
                        ),
                      for (final row in j['data'] as List)
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            report == 'top-pages'
                                ? '${row['path']}'
                                : report == 'top-entries'
                                ? row['entry_id'] == null
                                      ? 'Deleted entry'
                                      : 'Entry #${row['entry_id']}'
                                : row['referrer_host'] == null
                                ? 'Direct / unknown'
                                : row['referrer_host'] == 'other'
                                ? 'Other'
                                : '${row['referrer_host']}',
                          ),
                          trailing: Text('${row['total']}'),
                        ),
                    ],
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget daily(List<Map> rows) {
    final max = rows.fold<int>(
      0,
      (m, r) => (r[event] as int) > m ? r[event] as int : m,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${label(event)} · counts by UTC date'),
        Text('Count axis: 0 – $max'),
        const SizedBox(height: 8),
        // A scrollable bar chart keeps each day and count readable at large text sizes.
        for (final row in rows)
          Semantics(
            label: '${row['date']}, ${label(event)}, ${row[event]}',
            child: ExcludeSemantics(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${row['date']} · ${row[event]}'),
                    const SizedBox(height: 4),
                    LinearProgressIndicator(
                      value: max == 0 ? 0 : (row[event] as int) / max,
                      minHeight: 12,
                      color: const Color(0xFF126B5A),
                      backgroundColor: const Color(0xFFE8ECE9),
                    ),
                  ],
                ),
              ),
            ),
          ),
        if (rows.isEmpty) const Text('No daily data.'),
        const Text(
          'Date axis: inclusive UTC calendar dates. Legend: teal = selected event count.',
        ),
      ],
    );
  }
}
