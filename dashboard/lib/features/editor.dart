import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:portfolio_api/portfolio_api.dart';

import '../core/session.dart';
import '../core/ui.dart';
import 'resource_list.dart';

/// Explicit feature forms share controls, never serialize a response as a request.
const formSections = <String, Map<String, List<String>>>{
  'entries': {
    'Basics': ['title', 'summary'],
    'Cover and gallery': ['cover_media_id', 'gallery'],
    'Description': ['description'],
    'Classification and contributors': [
      'category_id',
      'technology_ids',
      'contributor_ids',
    ],
    'Links': ['repository_url', 'demo_url', 'external_url'],
    'Details and visibility': ['kind', 'slug', 'featured', 'sort_order'],
  },
  'team-members': {
    'Profile': ['name', 'role_title', 'bio'],
    'Photo and links': ['photo_media_id', 'links'],
    'Details': ['slug', 'sort_order', 'is_active'],
  },
  'services': {
    'Service': ['title', 'summary', 'description'],
    'Details': ['slug', 'icon_key', 'sort_order', 'is_active'],
  },
  'categories': {
    'Category': ['name', 'description', 'slug', 'sort_order'],
  },
  'technologies': {
    'Technology': ['name', 'website_url', 'slug'],
  },
  'site-settings': {
    'Studio': [
      'site_title',
      'tagline',
      'introduction',
      'contact_email',
      'availability',
    ],
    'Branding and links': ['logo_media_id', 'social_links'],
    'Search appearance': ['default_seo_title', 'default_seo_description'],
  },
  'inquiries': {
    'Manage inquiry': ['status', 'internal_note'],
  },
};

Map<String, dynamic> writableValues(String path, Json response) {
  final schema = path == 'site-settings'
      ? 'SettingsCreate'
      : path == 'inquiries'
      ? 'InquiryUpdate'
      : '${Resource.values.firstWhere((r) => r.path == path).schema}Create';
  final props = (writeSchemas[schema]!['properties'] as Map).keys;
  final result = <String, dynamic>{
    for (final key in props)
      if (response.containsKey(key) && key != 'published_at')
        key as String: response[key],
  };
  if (path == 'entries') {
    result['technology_ids'] = (response['technologies'] as List? ?? [])
        .map((e) => e['id'])
        .toList();
    result['contributor_ids'] = (response['contributors'] as List? ?? [])
        .map((e) => e['id'])
        .toList();
    result['gallery'] = (response['gallery'] as List? ?? [])
        .map(
          (e) => {
            'media_id': e['media']['id'],
            'alt_text': e['alt_text'],
            'sort_order': e['sort_order'],
          },
        )
        .toList();
  }
  return jsonDecode(jsonEncode(result)) as Map<String, dynamic>;
}

class EditorScreen extends ConsumerStatefulWidget {
  final String path;
  final int? id;
  const EditorScreen(this.path, {super.key, this.id});
  @override
  ConsumerState<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends ConsumerState<EditorScreen> {
  final form = GlobalKey<FormState>();
  final controllers = <String, TextEditingController>{};
  final anchors = <String, GlobalKey>{};
  final focusNodes = <String, FocusNode>{};
  Map<String, dynamic> values = {}, before = {}, response = {};
  Map<String, String> errors = {};
  Object? failure;
  bool loading = true, busy = false, dirty = false, ambiguous = false;
  final previews = <String>{};
  final mediaPreviews = <int, String?>{};
  String get path => widget.path;
  String get schema => path == 'site-settings'
      ? 'SettingsCreate'
      : path == 'inquiries'
      ? 'InquiryUpdate'
      : '${Resource.values.firstWhere((r) => r.path == path).schema}${widget.id == null ? 'Create' : 'Patch'}';
  String get draftKey => '$path/${widget.id ?? 'new'}';
  Map get properties => writeSchemas[schema]!['properties'] as Map;
  Resource get resource => Resource.values.firstWhere((r) => r.path == path);
  bool get existing => widget.id != null || path == 'site-settings';
  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  void dispose() {
    for (final c in controllers.values) {
      c.dispose();
    }
    for (final node in focusNodes.values) {
      node.dispose();
    }
    super.dispose();
  }

  Future<void> load() async {
    setState(() => loading = true);
    try {
      final api = ref.read(apiProvider);
      response = existing
          ? (path == 'site-settings'
                ? await api.settings()
                : await api.detail(resource, widget.id!))
          : {};
      before = existing ? writableValues(path, response) : {};
      mediaPreviews.clear();
      for (final key in ['cover', 'photo', 'logo']) {
        final media = response[key];
        if (media is Map && media['status'] == 'ready') {
          mediaPreviews[media['id'] as int] = media['thumbnail_url'] as String?;
        }
      }
      for (final item in response['gallery'] as List? ?? []) {
        final media = item['media'] as Map;
        mediaPreviews[media['id'] as int] = media['thumbnail_url'] as String?;
      }

      values = jsonDecode(jsonEncode(before)) as Json;
      if (!existing) {
        if (path == 'entries') {
          values.addAll({
            'kind': 'project',
            'status': 'draft',
            'featured': false,
            'sort_order': 0,
            'gallery': <Json>[],
            'technology_ids': <int>[],
            'contributor_ids': <int>[],
          });
        }
        if (path == 'team-members') {
          values.addAll({
            'is_active': false,
            'links': <Json>[],
            'sort_order': 0,
          });
        }
        if (path == 'services') {
          values.addAll({'is_active': false, 'sort_order': 0});
        }
        if (path == 'categories') values['sort_order'] = 0;
      }
      for (final c in controllers.values) {
        c.dispose();
      }
      controllers.clear();
      failure = null;
      dirty = false;
      ambiguous = false;
      final saved = ref.read(sessionProvider).drafts.remove(draftKey);
      if (saved != null &&
          mounted &&
          await confirm(
            context,
            'Review unsaved work',
            'The server was refetched. Restore your in-memory edits for review? Saving uses last write wins.',
            action: 'Restore edits',
          )) {
        values = saved;
        dirty = true;
      }
    } catch (e) {
      failure = e;
    }
    if (mounted) setState(() => loading = false);
  }

  void change(String key, dynamic value) {
    setState(() {
      values[key] = value;
      dirty = true;
      errors.remove(key);
      ref.read(sessionProvider).drafts[draftKey] =
          jsonDecode(jsonEncode(values)) as Json;
    });
  }

  Future<void> save() async {
    if (busy || ambiguous) return;
    // Controls already update typed form state; payload validates nested dotted paths.
    final fields = existing && path != 'site-settings'
        ? patchDiff(before, values)
        : Map<String, dynamic>.of(values);
    if (!existing && fields['slug'] == '') fields.remove('slug');
    final payload = WritePayload(schema, fields);
    errors = payload.validate();
    form.currentState!.validate();
    if (errors.isNotEmpty) {
      setState(() {});
      await focusError();
      return;
    }
    if (path == 'site-settings' &&
        !await confirm(
          context,
          'Update public site?',
          'These settings are immediately visible on the public website.',
          action: 'Save settings',
        )) {
      return;
    }
    setState(() {
      busy = true;
      failure = null;
    });
    try {
      final api = ref.read(apiProvider);
      final saved = path == 'site-settings'
          ? await api.putSettings(payload)
          : await api.save(resource, payload, id: widget.id);
      if (!mounted) return;
      dirty = false;
      ref.read(sessionProvider).drafts.remove(draftKey);
      if (widget.id == null && path != 'site-settings') {
        setState(() {
          dirty = false;
          busy = false;
        });
        await WidgetsBinding.instance.endOfFrame;
        if (mounted) Navigator.pop(context, saved);
        return;
      }
      await load();
      if (mounted) notice(context, 'Saved. Latest server data loaded.');
    } on ApiFailure catch (e) {
      if (mounted) {
        setState(() {
          failure = e;
          errors = e.fields.map((k, v) => MapEntry(k, v.join('\n')));
          ambiguous = e.ambiguous;
        });
        form.currentState?.validate();
        await focusError();
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          failure = e;
          if (e is ApiFailure && e.ambiguous) ambiguous = true;
        });
      }
    } finally {
      if (mounted) setState(() => busy = false);
    }
  }

  Future<void> focusError() async {
    await WidgetsBinding.instance.endOfFrame;
    if (!mounted || errors.isEmpty) return;
    final key = errors.keys.first;
    final ctx =
        anchors[key]?.currentContext ??
        anchors[key.split('.').take(key.split('.').length - 1).join('.')]
            ?.currentContext ??
        anchors[key.split('.').first]?.currentContext;
    if (ctx != null && ctx.mounted) {
      await Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 250),
      );
      if (!mounted) return;
      final currentContext =
          anchors[key]?.currentContext ??
          anchors[key.split('.').first]?.currentContext;
      if (currentContext != null && currentContext.mounted) {
        focusNodes[key]?.requestFocus();
      }
    }
  }

  Future<void> visibility(String status) async {
    if (dirty) {
      await save();
      if (dirty || failure != null || !mounted) return;
    }
    if (status == 'published') {
      if (response['cover']?['status'] != 'ready' ||
          [
            'title',
            'summary',
            'description',
          ].any((k) => (response[k]?.toString().trim() ?? '').isEmpty)) {
        notice(
          context,
          'Save required text and a ready cover before publishing.',
        );
        return;
      }
    }
    final approved = status == 'published'
        ? await Navigator.push<bool>(
                context,
                MaterialPageRoute(
                  builder: (_) => PublishReviewScreen(entry: response),
                ),
              ) ??
              false
        : await confirm(
            context,
            'Change visibility',
            status == 'draft'
                ? 'This entry will be hidden from the public website.'
                : 'This entry will be archived and hidden.',
            action: label(status),
          );
    if (!approved || !mounted) return;
    setState(() => busy = true);
    try {
      await ref
          .read(apiProvider)
          .save(
            Resource.entries,
            WritePayload('EntryPatch', {'status': status}),
            id: widget.id,
          );
      await load();
    } catch (e) {
      if (mounted) {
        setState(() {
          failure = e;
          if (e is ApiFailure && e.ambiguous) ambiguous = true;
        });
      }
    } finally {
      if (mounted) setState(() => busy = false);
    }
  }

  Future<void> remove() async {
    final extra = path == 'team-members'
        ? ' Contributor references will be detached.'
        : path == 'inquiries'
        ? ' This permanently deletes this private message.'
        : ' Media files will remain in the library.';
    if (!await confirm(
      context,
      'Delete permanently?',
      'This action cannot be undone.$extra',
      action: 'Delete',
    )) {
      return;
    }
    setState(() => busy = true);
    try {
      await ref.read(apiProvider).delete(resource, widget.id!);
      if (mounted) {
        setState(() {
          dirty = false;
          busy = false;
        });
      }
      await WidgetsBinding.instance.endOfFrame;
      if (mounted) Navigator.pop(context);
    } catch (e) {
      if (mounted) {
        setState(() {
          failure = e;
          if (e is ApiFailure && e.ambiguous) ambiguous = true;
        });
      }
    } finally {
      if (mounted) setState(() => busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final title = path == 'site-settings'
        ? 'Site settings'
        : path == 'inquiries'
        ? 'Inquiry'
        : existing && path == 'entries'
        ? 'Edit ${response['kind'] ?? 'entry'}'
        : existing
        ? 'Edit ${label(path)}'
        : 'Create ${label(path)}';
    return PopScope(
      canPop: !dirty && !busy,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop &&
            !busy &&
            await confirm(
              context,
              'Discard unsaved changes?',
              'Your edits will be lost.',
              action: 'Discard',
            ) &&
            context.mounted) {
          setState(() => dirty = false);
          ref.read(sessionProvider).drafts.remove(draftKey);
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: SafeArea(
          child: loading
              ? const Center(child: CircularProgressIndicator())
              : failure != null && response.isEmpty && existing
              ? PageBody(children: [ErrorPanel(failure!, retry: load)])
              : Form(
                  key: form,
                  child: PageBody(
                    children: [
                      if (failure != null) ErrorPanel(failure!),
                      if (ambiguous) ...[
                        const Text(
                          'The result is uncertain. Reload the server version and compare it before resubmitting. Your edits remain in memory until you choose to reload.',
                        ),
                        OutlinedButton(
                          onPressed: () async {
                            if (!existing) {
                              if (await confirm(
                                    context,
                                    'Review existing content',
                                    'The creation may have succeeded. Leave this editor and review the content list before creating another item.',
                                    action: 'Review list',
                                  ) &&
                                  mounted) {
                                ref
                                    .read(sessionProvider)
                                    .drafts
                                    .remove(draftKey);
                                setState(() => dirty = false);
                                await WidgetsBinding.instance.endOfFrame;
                                if (context.mounted) Navigator.pop(context);
                              }
                              return;
                            }
                            if (await confirm(
                              context,
                              'Reload server version?',
                              'Review the saved server data. Current unsaved edits will be discarded.',
                              action: 'Reload',
                            )) {
                              await load();
                            }
                          },
                          child: Text(
                            existing
                                ? 'Reload and review'
                                : 'Review existing content',
                          ),
                        ),
                      ],
                      if (path == 'inquiries') ...[
                        Text(
                          '${response['subject']}',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        SelectableText(
                          '${response['name']} <${response['email']}>\n${localTime(response['submitted_at'])}',
                        ),
                        const SizedBox(height: 16),
                        SelectableText('${response['message']}'),
                        TextButton.icon(
                          onPressed: () async {
                            final email = response['email']?.toString() ?? '';
                            if (!RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$')
                                    .hasMatch(email) ||
                                email.contains(RegExp(r'[\r\n]'))) {
                              notice(context, 'Invalid email address.');
                              return;
                            }
                            await openMail(
                              context,
                              email,
                              response['subject'] as String? ?? '',
                            );
                          },
                          icon: const Icon(Icons.mail_outline),
                          label: const Text('Open email app'),
                        ),
                        const Text(
                          'Replied records an external reply. This app does not send email.',
                        ),
                      ],
                      if (path == 'entries')
                        Align(
                          alignment: Alignment.centerLeft,
                          child: StatusBadge(
                            '${response['status'] ?? 'draft'}',
                          ),
                        ),
                      for (final section in formSections[path]!.entries) ...[
                        const SizedBox(height: 24),
                        Text(
                          section.key,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 16),
                        for (final key in section.value)
                          Padding(
                            key: anchors.putIfAbsent(key, () => GlobalKey()),
                            padding: const EdgeInsets.only(bottom: 16),
                            child: field(key),
                          ),
                      ],
                      if (path == 'entries') ...[
                        Text(
                          'Search preview',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text('${values['title'] ?? ''}'),
                        Text('${values['summary'] ?? ''}'),
                        if (existing)
                          Text(
                            'Status: ${response['status']}\nPublished: ${localTime(response['published_at'])}',
                          ),
                      ],
                      if (errors.isNotEmpty)
                        Semantics(
                          liveRegion: true,
                          child: Text(
                            errors.entries
                                .map((e) => '${label(e.key)}: ${e.value}')
                                .join('\n'),
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.error,
                            ),
                          ),
                        ),
                      const SizedBox(height: 24),
                      FilledButton(
                        onPressed: busy || ambiguous ? null : save,
                        child: Text(busy ? 'Saving…' : 'Save changes'),
                      ),
                      if (path == 'entries' && existing)
                        Wrap(
                          spacing: 8,
                          children: [
                            for (final state in [
                              'published',
                              'draft',
                              'archived',
                            ])
                              if (response['status'] != state)
                                TextButton(
                                  onPressed: busy || ambiguous
                                      ? null
                                      : () => visibility(state),
                                  child: Text(
                                    state == 'published'
                                        ? 'Review and publish'
                                        : state == 'draft'
                                        ? 'Unpublish / draft'
                                        : 'Archive',
                                  ),
                                ),
                          ],
                        ),
                      if (existing && path != 'site-settings')
                        TextButton.icon(
                          onPressed: busy || ambiguous ? null : remove,
                          icon: const Icon(Icons.delete_outline),
                          label: const Text('Delete permanently'),
                        ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget field(String key) {
    final s = properties[key] as Map;
    final value = values[key];
    final t = s['type'];
    if ([
      'cover_media_id',
      'photo_media_id',
      'logo_media_id',
      'category_id',
    ].contains(key)) {
      final r = key == 'category_id' ? Resource.categories : Resource.media;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label(key.replaceAll('_id', ''))),
          if (value is int && mediaPreviews[value] != null)
            PublicThumbnail(mediaPreviews[value]),
          Wrap(
            spacing: 8,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(value == null ? 'None selected' : 'Selected #$value'),
              OutlinedButton(
                onPressed: busy
                    ? null
                    : () async {
                        final chosen = await pickResource(context, r);
                        if (chosen != null && mounted) {
                          if (r == Resource.media) {
                            mediaPreviews[chosen['id'] as int] =
                                chosen['thumbnail_url'] as String?;
                          }
                          change(key, chosen['id']);
                        }
                      },
                child: const Text('Choose'),
              ),
              TextButton(
                onPressed: busy ? null : () => change(key, null),
                child: const Text('Clear'),
              ),
            ],
          ),
          if (errors[key] != null)
            Text(
              errors[key]!,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
        ],
      );
    }
    if (key == 'technology_ids' || key == 'contributor_ids') {
      final ids = List<int>.from(value as List? ?? []);
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label(key)),
          Wrap(
            spacing: 8,
            children: [
              for (final id in ids)
                InputChip(
                  label: Text('#$id'),
                  onDeleted: busy
                      ? null
                      : () {
                          ids.remove(id);
                          change(key, ids);
                        },
                ),
            ],
          ),
          OutlinedButton(
            onPressed: busy
                ? null
                : () async {
                    final chosen = await pickResource(
                      context,
                      key == 'technology_ids'
                          ? Resource.technologies
                          : Resource.team,
                    );
                    if (chosen != null &&
                        mounted &&
                        !ids.contains(chosen['id'])) {
                      change(key, [...ids, chosen['id']]);
                    }
                  },
            child: const Text('Add selection'),
          ),
        ],
      );
    }
    if (key == 'gallery') return gallery();
    if (key == 'links' || key == 'social_links') return links(key);
    if (t == 'boolean') {
      return SwitchListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(label(key)),
        value: value == true,
        onChanged: busy ? null : (v) => change(key, v),
      );
    }
    if (s['enum'] is List) {
      return DropdownButtonFormField<String>(
        initialValue: value as String?,
        isExpanded: true,
        decoration: InputDecoration(
          labelText: label(key),
          errorText: errors[key],
        ),
        items: [
          for (final v in s['enum'] as List)
            DropdownMenuItem(value: v as String, child: Text(label(v))),
        ],
        onChanged: busy ? null : (v) => change(key, v),
      );
    }
    if (key == 'icon_key') {
      return DropdownButtonFormField<String>(
        initialValue: value as String?,
        isExpanded: true,
        decoration: InputDecoration(labelText: 'Icon', errorText: errors[key]),
        items: [
          const DropdownMenuItem(value: null, child: Text('None')),
          for (final v in {
            'design',
            'code',
            'mobile',
            'web',
            'consulting',
            if (value is String) value,
          })
            DropdownMenuItem(value: v, child: Text(label(v))),
        ],
        onChanged: busy ? null : (v) => change(key, v),
      );
    }
    final controller = controllers.putIfAbsent(
      key,
      () => TextEditingController(text: value?.toString() ?? ''),
    );
    final markdown =
        ['description', 'bio', 'introduction'].contains(key) &&
        (s['maxLength'] as int? ?? 0) > 1000;
    final multiline =
        markdown ||
        [
          'summary',
          'tagline',
          'internal_note',
          'default_seo_description',
        ].contains(key);
    final input = TextFormField(
      key: ValueKey('field-$key'),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      focusNode: focusNodes.putIfAbsent(key, () => FocusNode()),
      controller: controller,
      enabled: !busy,
      maxLines: multiline ? 5 : 1,
      maxLength: s['maxLength'] as int?,
      keyboardType: t == 'integer'
          ? const TextInputType.numberWithOptions(signed: true)
          : multiline
          ? TextInputType.multiline
          : key.endsWith('url')
          ? TextInputType.url
          : TextInputType.text,
      decoration: InputDecoration(
        labelText: label(key),
        alignLabelWithHint: true,
        helperText: key == 'slug'
            ? 'Leave empty when creating to generate once.'
            : null,
      ),
      validator: (_) => errors[key],
      onChanged: (v) {
        if (t == 'integer') {
          final n = int.tryParse(v);
          if (n == null) {
            change(key, v);
            return;
          }
          change(key, n);
        } else {
          change(key, v.isEmpty && t is List && t.contains('null') ? null : v);
        }
      },
    );
    if (!markdown) return input;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8,
          children: [
            TextButton(
              onPressed: () => setState(() => previews.remove(key)),
              child: const Text('Write'),
            ),
            TextButton(
              onPressed: () => setState(() => previews.add(key)),
              child: const Text('Preview'),
            ),
          ],
        ),
        if (!previews.contains(key))
          input
        else
          MarkdownBody(
            data: controller.text,
            onTapLink: (_, href, _) {
              if (href != null) openWeb(context, href);
            },
            selectable: true,
          ),
      ],
    );
  }

  Widget links(String key) {
    final rows = (values[key] as List? ?? [])
        .map((e) => Map<String, dynamic>.from(e as Map))
        .toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < rows.length; i++)
          Card(
            key: anchors.putIfAbsent('$key.$i', () => GlobalKey()),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  TextFormField(
                    key: ValueKey('$key.$i.label.${rows.length}'),
                    focusNode: focusNodes.putIfAbsent(
                      '$key.$i.label',
                      () => FocusNode(),
                    ),
                    initialValue: rows[i]['label'] as String?,
                    maxLength: 80,
                    decoration: InputDecoration(
                      labelText: 'Link ${i + 1} label',
                      errorText: errors['$key.$i.label'],
                    ),
                    onChanged: (v) {
                      rows[i]['label'] = v;
                      change(key, rows);
                    },
                  ),
                  TextFormField(
                    key: ValueKey('$key.$i.url.${rows.length}'),
                    focusNode: focusNodes.putIfAbsent(
                      '$key.$i.url',
                      () => FocusNode(),
                    ),
                    initialValue: rows[i]['url'] as String?,
                    maxLength: 2048,
                    decoration: InputDecoration(
                      labelText: 'HTTP(S) URL',
                      errorText: errors['$key.$i.url'],
                    ),
                    onChanged: (v) {
                      rows[i]['url'] = v;
                      change(key, rows);
                    },
                  ),
                  TextFormField(
                    key: ValueKey('$key.$i.order.${rows.length}'),
                    initialValue: '${rows[i]['sort_order'] ?? i}',
                    keyboardType: const TextInputType.numberWithOptions(
                      signed: true,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Display order',
                    ),
                    onChanged: (v) {
                      rows[i]['sort_order'] = int.tryParse(v) ?? i;
                      change(key, rows);
                    },
                  ),
                  TextButton(
                    onPressed: busy
                        ? null
                        : () {
                            rows.removeAt(i);
                            change(key, rows);
                          },
                    child: const Text('Remove link'),
                  ),
                ],
              ),
            ),
          ),
        OutlinedButton(
          onPressed: busy || rows.length >= 10
              ? null
              : () => change(key, [
                  ...rows,
                  {'label': '', 'url': '', 'sort_order': rows.length},
                ]),
          child: const Text('Add link'),
        ),
      ],
    );
  }

  Widget gallery() {
    final rows = (values['gallery'] as List? ?? [])
        .map((e) => Map<String, dynamic>.from(e as Map))
        .toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < rows.length; i++)
          Card(
            key: anchors.putIfAbsent('gallery.$i', () => GlobalKey()),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PublicThumbnail(mediaPreviews[rows[i]['media_id']]),
                  Text('Image #${rows[i]['media_id']}'),
                  TextFormField(
                    key: ValueKey('gallery.$i.${rows[i]['media_id']}'),
                    focusNode: focusNodes.putIfAbsent(
                      'gallery.$i.alt_text',
                      () => FocusNode(),
                    ),
                    initialValue: rows[i]['alt_text'] as String?,
                    maxLength: 500,
                    decoration: InputDecoration(
                      labelText: 'Alternative text',
                      errorText: errors['gallery.$i.alt_text'],
                    ),
                    onChanged: (v) {
                      rows[i]['alt_text'] = v;
                      change('gallery', rows);
                    },
                  ),
                  Wrap(
                    children: [
                      IconButton(
                        tooltip: 'Move image up',
                        onPressed: busy || i == 0
                            ? null
                            : () {
                                final item = rows.removeAt(i);
                                rows.insert(i - 1, item);
                                reorder(rows);
                              },
                        icon: const Icon(Icons.arrow_upward),
                      ),
                      IconButton(
                        tooltip: 'Move image down',
                        onPressed: busy || i == rows.length - 1
                            ? null
                            : () {
                                final item = rows.removeAt(i);
                                rows.insert(i + 1, item);
                                reorder(rows);
                              },
                        icon: const Icon(Icons.arrow_downward),
                      ),
                      TextButton(
                        onPressed: busy
                            ? null
                            : () {
                                rows.removeAt(i);
                                reorder(rows);
                              },
                        child: const Text('Remove reference'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        OutlinedButton(
          onPressed: busy || rows.length >= 20
              ? null
              : () async {
                  final media = await pickResource(context, Resource.media);
                  if (media != null &&
                      mounted &&
                      !rows.any((e) => e['media_id'] == media['id'])) {
                    mediaPreviews[media['id'] as int] =
                        media['thumbnail_url'] as String?;
                    change('gallery', [
                      ...rows,
                      {
                        'media_id': media['id'],
                        'alt_text': '',
                        'sort_order': rows.length,
                      },
                    ]);
                  }
                },
          child: const Text('Add ready image'),
        ),
      ],
    );
  }

  void reorder(List<Json> rows) {
    for (var i = 0; i < rows.length; i++) {
      rows[i]['sort_order'] = i;
    }
    change('gallery', rows);
  }
}

class PublishReviewScreen extends StatelessWidget {
  final Json entry;
  const PublishReviewScreen({super.key, required this.entry});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Publish review')),
    body: SafeArea(
      child: PageBody(
        children: [
          const StudioHeading(
            eyebrow: 'PUBLISH REVIEW',
            title: 'Ready to go live?',
          ),
          const SizedBox(height: 24),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${entry['title']}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  const Text('Your project will be visible on the website.'),
                  const SizedBox(height: 8),
                  const StatusBadge('Cover image ready'),
                  const SizedBox(height: 8),
                  for (final title in [
                    'Title & summary',
                    'Description',
                    'Visibility',
                  ])
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        children: [
                          Expanded(child: Text(title)),
                          Text(title == 'Visibility' ? 'Public' : 'Ready'),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Published media URLs remain accessible even after an entry is unpublished.',
          ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text('Publish ${entry['kind'] ?? 'project'}'),
          ),
          const SizedBox(height: 16),
          OutlinedButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Keep as draft'),
          ),
        ],
      ),
    ),
  );
}
