import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_api/portfolio_api.dart';

import '../core/session.dart';
import '../core/ui.dart';
import '../core/paged_controller.dart';
import 'media.dart';

String resourceTitle(Resource r) => switch (r) {
  Resource.entries => 'Content',
  Resource.team => 'Team',
  Resource.audit => 'Activity log',
  _ => label(r.path),
};

class ResourceListScreen extends ConsumerStatefulWidget {
  final Resource resource;
  final bool picker;
  const ResourceListScreen(this.resource, {super.key, this.picker = false});
  @override
  ConsumerState<ResourceListScreen> createState() => _ResourceListScreenState();
}

class _ResourceListScreenState extends ConsumerState<ResourceListScreen> {
  late PagedController data;
  late OwnerSession session;
  int revision = 0;
  @override
  void initState() {
    super.initState();
    data = PagedController(
      ref.read(apiProvider),
      widget.resource,
      filters: widget.picker && widget.resource == Resource.media
          ? {'state': 'ready'}
          : {},
    );
    data.load(reset: true);
    session = ref.read(sessionProvider);
    revision = session.revision;
    session.addListener(invalidate);
  }

  void invalidate() {
    if (mounted && revision != session.revision) {
      revision = session.revision;
      data.load(reset: true);
    }
  }

  @override
  void dispose() {
    session.removeListener(invalidate);
    data.dispose();
    super.dispose();
  }

  Map<String, List<String>> get filters => switch (widget.resource) {
    Resource.entries => {
      'kind': ['project', 'product'],
      'status': ['draft', 'published', 'archived'],
      'featured': ['0', '1'],
      'sort': ['id', 'created_at', 'updated_at', 'sort_order'],
      'direction': ['asc', 'desc'],
    },
    Resource.team || Resource.services => {
      'active': ['0', '1'],
      'sort': ['id', 'created_at', 'updated_at', 'sort_order'],
      'direction': ['asc', 'desc'],
    },
    Resource.categories => {
      'sort': ['id', 'created_at', 'updated_at', 'sort_order'],
      'direction': ['asc', 'desc'],
    },
    Resource.technologies => {
      'sort': ['id', 'created_at', 'updated_at'],
      'direction': ['asc', 'desc'],
    },
    Resource.inquiries => {
      'status': ['new', 'read', 'replied', 'archived'],
    },
    Resource.media => {
      'state': ['processing', 'ready', 'failed', 'deleting'],
      'usage': ['used', 'unused'],
    },
    Resource.audit => {},
  };
  Future<void> open(Json item) async {
    if (widget.picker) {
      Navigator.pop(context, item);
      return;
    }
    await context.push('/${widget.resource.path}/${item['id']}');
    if (mounted) await data.load(reset: true);
  }

  Future<void> create() async {
    final r = widget.resource;
    if (r == Resource.media) {
      await Navigator.push(
        context,
        MaterialPageRoute<void>(builder: (_) => const UploadScreen()),
      );
    } else {
      await context.push('/${r.path}/new');
    }
    if (mounted) await data.load(reset: true);
  }

  @override
  Widget build(BuildContext context) {
    final r = widget.resource;
    final search = [
      Resource.entries,
      Resource.categories,
      Resource.technologies,
      Resource.services,
      Resource.team,
    ].contains(r);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.picker
              ? 'Choose ${r == Resource.media ? 'ready image' : resourceTitle(r)}'
              : r == Resource.entries
              ? 'Your content'
              : resourceTitle(r),
        ),
      ),
      body: SafeArea(
        child: AnimatedBuilder(
          animation: data,
          builder: (context, _) => RefreshIndicator(
            onRefresh: () => data.load(reset: true),
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 840),
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
                  children: [
                    if (r == Resource.entries) ...[
                      const Text('PROJECTS & PRODUCTS'),
                      const SizedBox(height: 16),
                    ],
                    if (search) ...[
                      TextField(
                        maxLength: 100,
                        onChanged: data.search,
                        decoration: const InputDecoration(
                          labelText: 'Search',
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                    if (r == Resource.entries)
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          for (final item in {
                            'project': 'Projects',
                            'product': 'Products',
                          }.entries)
                            FilterChip(
                              label: Text(item.value),
                              selected: data.filters['kind'] == item.key,
                              onSelected: (selected) => data.filter(
                                'kind',
                                selected ? item.key : null,
                              ),
                            ),
                          FilterChip(
                            label: const Text('Draft'),
                            selected: data.filters['status'] == 'draft',
                            onSelected: (selected) => data.filter(
                              'status',
                              selected ? 'draft' : null,
                            ),
                          ),
                        ],
                      ),
                    ExpansionTile(
                      title: const Text('Filters and ordering'),
                      children: [
                        for (final e in filters.entries)
                          if (!(widget.picker &&
                              r == Resource.media &&
                              e.key == 'state'))
                            Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: DropdownButtonFormField<String>(
                                initialValue: data.filters[e.key] as String?,
                                isExpanded: true,
                                decoration: InputDecoration(
                                  labelText: label(e.key),
                                ),
                                items: [
                                  const DropdownMenuItem(
                                    value: '',
                                    child: Text('All / default'),
                                  ),
                                  for (final v in e.value)
                                    DropdownMenuItem(
                                      value: v,
                                      child: Text(
                                        e.key == 'active' || e.key == 'featured'
                                            ? (v == '1' ? 'Yes' : 'No')
                                            : label(v),
                                      ),
                                    ),
                                ],
                                onChanged: (v) => data.filter(e.key, v),
                              ),
                            ),
                        for (final key in switch (r) {
                          Resource.entries => ['category', 'technology'],
                          Resource.audit => [
                            'action',
                            'entity_type',
                            'start_date',
                            'end_date',
                          ],
                          Resource.inquiries => ['start_date', 'end_date'],
                          _ => <String>[],
                        })
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText:
                                    '${label(key)}${key.endsWith('date')
                                        ? ' (YYYY-MM-DD UTC)'
                                        : r == Resource.entries
                                        ? ' slug'
                                        : ''}',
                              ),
                              onFieldSubmitted: (v) =>
                                  data.filter(key, v.trim()),
                            ),
                          ),
                        TextButton(
                          onPressed: () {
                            data.filters.clear();
                            if (widget.picker && r == Resource.media) {
                              data.filters['state'] = 'ready';
                            }
                            data.load(reset: true);
                          },
                          child: const Text('Clear filters'),
                        ),
                      ],
                    ),
                    if (!widget.picker &&
                        ![Resource.audit, Resource.inquiries].contains(r) &&
                        !(r == Resource.entries &&
                            data.items.isEmpty &&
                            data.filters.isEmpty &&
                            !data.loading))
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: FilledButton(
                          onPressed: create,
                          child: Text(
                            r == Resource.media
                                ? 'Upload image'
                                : r == Resource.entries
                                ? 'Add entry'
                                : 'Create',
                          ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        '${data.total} items',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    if (data.loading) const LinearProgressIndicator(),
                    if (data.error != null)
                      ErrorPanel(
                        data.error!,
                        retry: () => data.load(reset: data.page == 0),
                      ),
                    if (!data.loading &&
                        data.error == null &&
                        data.items.isEmpty)
                      Card(
                        color: r == Resource.entries
                            ? const Color(0xFFE5F2EC)
                            : null,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                data.filters.isEmpty
                                    ? r == Resource.entries
                                          ? 'Your next project starts here.'
                                          : 'Nothing here yet'
                                    : 'No items match your filters',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(height: 8),
                              if (data.filters.isEmpty &&
                                  r == Resource.entries) ...[
                                const Text(
                                  'Add your first project or product, then publish it when you are ready.',
                                ),
                                const SizedBox(height: 16),
                                FilledButton(
                                  onPressed: create,
                                  child: const Text('Create first entry'),
                                ),
                              ],
                              if (data.filters.isNotEmpty)
                                TextButton(
                                  onPressed: () {
                                    data.filters.clear();
                                    if (widget.picker && r == Resource.media) {
                                      data.filters['state'] = 'ready';
                                    }
                                    data.load(reset: true);
                                  },
                                  child: const Text('Clear filters'),
                                ),
                            ],
                          ),
                        ),
                      ),
                    for (final item in data.items) _tile(item, r),
                    if (data.page < data.lastPage)
                      OutlinedButton(
                        onPressed: data.loading ? null : () => data.load(),
                        child: const Text('Load more'),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _tile(Json item, Resource r) {
    if (r == Resource.audit) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${item['action']}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text('${item['entity_type']} #${item['entity_id']}'),
              Text(localTime(item['created_at'])),
              Text(
                'Fields: ${((item['summary'] as Map?)?['fields'] as List? ?? []).join(', ')}',
              ),
            ],
          ),
        ),
      );
    }
    if (r == Resource.entries) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Card(
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () => open(item),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${item['title']}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${item['summary']}',
                    style: const TextStyle(color: Color(0xFF5D706C)),
                  ),
                  const SizedBox(height: 8),
                  StatusBadge('${item['status']}'),
                  const SizedBox(height: 8),
                  if (item['cover'] is Map &&
                      item['cover']['status'] == 'ready')
                    PublicThumbnail(item['cover']['thumbnail_url'] as String?),
                  Text(
                    [
                      ...(item['technologies'] as List? ?? []).map(
                        (t) => t['name'],
                      ),
                      if (item['kind'] != null) label(item['kind']),
                    ].join(' · '),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
    final image = item[r == Resource.team ? 'photo' : 'cover'] as Map?;
    final subtitle = r == Resource.media
        ? '${item['status']} · ${item['width']} × ${item['height']} · ${item['bytes']} bytes\nUsed ${item['usage_count']} times'
        : r == Resource.inquiries
        ? '${item['name']} · ${item['status']}\n${localTime(item['submitted_at'])}'
        : '${item['status'] ?? (item.containsKey('is_active') ? (item['is_active'] == true ? 'Active' : 'Inactive') : item['slug'] ?? '')}${item.containsKey('sort_order') ? ' · Order ${item['sort_order']}' : ''}';
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: r == Resource.media
            ? PublicThumbnail(
                item['status'] == 'ready'
                    ? item['thumbnail_url'] as String?
                    : null,
              )
            : image == null
            ? null
            : PublicThumbnail(image['thumbnail_url'] as String?),
        title: Text(
          '${item['title'] ?? item['name'] ?? item['subject'] ?? item['original_filename'] ?? '#${item['id']}'}',
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(subtitle),
            const SizedBox(height: 8),
            if (item['status'] is String) StatusBadge(item['status'] as String),
          ],
        ),
        trailing: const Icon(Icons.chevron_right),
        enabled:
            !(widget.picker &&
                r == Resource.media &&
                item['status'] != 'ready'),
        onTap: widget.picker && r == Resource.media && item['status'] != 'ready'
            ? null
            : () => open(item),
      ),
    );
  }
}

Future<Json?> pickResource(BuildContext context, Resource r) =>
    Navigator.push<Json>(
      context,
      MaterialPageRoute(builder: (_) => ResourceListScreen(r, picker: true)),
    );
