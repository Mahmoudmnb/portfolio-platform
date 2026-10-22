import 'dart:io';

import 'package:portfolio_api/portfolio_api.dart';

void check(bool ok, String message) {
  if (!ok) throw StateError(message);
}

Future<void> main() async {
  final env = Platform.environment,
      base = Platform.environment['DASHBOARD_SMOKE_BASE'] ?? '';
  if (env['DASHBOARD_CONFIRM_DISPOSABLE'] != '1' ||
      !['127.0.0.1', 'localhost'].contains(Uri.parse(base).host)) {
    throw StateError('Explicit disposable loopback environment required');
  }
  final password = File(env['DASHBOARD_SMOKE_SECRET_FILE']!)
      .readAsStringSync()
      .trim();
  String? token;
  final api = PortfolioApi(base, credentials: () => token);
  final login = await api.login(env['DASHBOARD_SMOKE_EMAIL']!, password);
  token = login.token;
  api.newSession();
  check((await api.me()).id == login.user.id, 'me identity');
  final created = <Resource, List<int>>{}, settings = await api.settings();
  bool settingsChanged = false;
  Json settingsPayload() => {
    for (final k in (writeSchemas['SettingsCreate']!['properties'] as Map).keys)
      if (settings.containsKey(k)) k as String: settings[k],
  };
  Future<Json> create(Resource r, Json data) async {
    final v = await api.save(r, WritePayload('${r.schema}Create', data));
    created.putIfAbsent(r, () => []).add(v['id'] as int);
    return v;
  }

  try {
    final media = await api.upload(
      env['DASHBOARD_SMOKE_IMAGE']!,
      'fictional-dashboard.png',
    );
    created[Resource.media] = [media.id];
    var ready = media;
    final deadline = DateTime.now().add(const Duration(minutes: 2));
    while (ready.status == 'processing' && DateTime.now().isBefore(deadline)) {
      await Future<void>.delayed(const Duration(seconds: 2));
      ready = AdminMedia.fromJson(await api.detail(Resource.media, media.id));
    }
    check(ready.status == 'ready', 'image processing');
    final client = HttpClient();
    final req = await client.getUrl(
      Uri.parse(ready.thumbnail_url!).replace(host: '127.0.0.1'),
    );
    final res = await req.close();
    check(res.statusCode == 200, 'thumbnail reachability');
    await res.drain<void>();
    client.close();
    final category = await create(Resource.categories, {
      'name': 'Dashboard smoke category',
    });
    final tech = await create(Resource.technologies, {
      'name': 'Dashboard smoke technology',
      'website_url': 'https://example.test',
    });
    final team = await create(Resource.team, {
      'name': 'Fictional member',
      'role_title': 'Designer',
      'bio': 'Fictional profile',
      'is_active': false,
      'photo_media_id': media.id,
      'links': [
        {'label': 'Website', 'url': 'https://example.test', 'sort_order': 0},
      ],
    });
    await api.save(
      Resource.team,
      WritePayload('TeamMemberPatch', {'is_active': true}),
      id: team['id'] as int,
    );
    final service = await create(Resource.services, {
      'title': 'Fictional service',
      'summary': 'Test summary',
      'description': 'Test description',
      'is_active': true,
      'icon_key': 'code',
    });
    await api.save(
      Resource.services,
      WritePayload('ServicePatch', {'sort_order': 3, 'is_active': false}),
      id: service['id'] as int,
    );
    final entry = await create(Resource.entries, {
      'kind': 'project',
      'title': 'Fictional dashboard smoke',
      'summary': 'Integration summary',
      'description': 'Integration **Markdown**',
      'cover_media_id': media.id,
      'category_id': category['id'],
      'technology_ids': [tech['id']],
      'contributor_ids': [team['id']],
      'gallery': [
        {'media_id': media.id, 'alt_text': 'Fictional image', 'sort_order': 0},
      ],
    });
    final id = entry['id'] as int;
    var detail = AdminEntry.fromJson(await api.detail(Resource.entries, id));
    check(
      detail.gallery.single['alt_text'] == 'Fictional image',
      'gallery persisted',
    );
    check(detail.technologies.single.id == tech['id'], 'technology persisted');
    await api.save(
      Resource.entries,
      WritePayload('EntryPatch', {'status': 'published'}),
      id: id,
    );
    final public = await api.request(
      'GET',
      'entries/${entry['slug']}',
      protected: false,
    );
    check((public['data'] as Map)['title'] == entry['title'], 'public entry');
    await api.save(
      Resource.entries,
      WritePayload('EntryPatch', {
        'title': 'Renamed smoke entry',
        'category_id': null,
        'technology_ids': [],
        'status': 'draft',
      }),
      id: id,
    );
    detail = AdminEntry.fromJson(await api.detail(Resource.entries, id));
    check(detail.slug == entry['slug'], 'stable slug');
    check(
      detail.category == null && detail.technologies.isEmpty,
      'null/empty replacement',
    );
    check(
      detail.contributors.length == 1 && detail.gallery.length == 1,
      'omitted relations',
    );
    try {
      await api.request('GET', 'entries/${entry['slug']}', protected: false);
      throw StateError('Draft remained public');
    } on ApiFailure catch (e) {
      check(e.status == 404, 'public draft 404');
    }
    try {
      await api.delete(Resource.media, media.id);
      throw StateError('Used media deleted');
    } on ApiFailure catch (e) {
      check(e.status == 409, 'media conflict');
    }
    try {
      await api.delete(Resource.categories, category['id'] as int);
      created[Resource.categories]!.clear();
    } on ApiFailure catch (e) {
      check(e.status == 409, 'taxonomy conflict');
    }
    final full = settingsPayload()
      ..['tagline'] = 'Fictional dashboard smoke tagline';
    final updated = await api.putSettings(WritePayload('SettingsCreate', full));
    settingsChanged = true;
    check(
      updated['contact_email'] == settings['contact_email'],
      'settings preservation',
    );
    await api.request(
      'POST',
      'inquiries',
      protected: false,
      body: {
        'name': 'Fictional visitor',
        'email': 'visitor@example.test',
        'subject': 'Dashboard smoke',
        'message': 'Fictional disposable message',
      },
    );
    final inbox = await api.list(Resource.inquiries, query: {'status': 'new'});
    final inquiry = inbox.items.firstWhere(
      (i) => i['subject'] == 'Dashboard smoke',
    );
    created[Resource.inquiries] = [inquiry['id'] as int];
    check(
      (await api.detail(Resource.inquiries, inquiry['id'] as int))['status'] ==
          'new',
      'GET does not mark read',
    );
    await api.save(
      Resource.inquiries,
      WritePayload('InquiryUpdate', {
        'status': 'read',
        'internal_note': 'Fictional private note',
      }),
      id: inquiry['id'] as int,
    );
    check(
      (await api.detail(
            Resource.inquiries,
            inquiry['id'] as int,
          ))['internal_note'] ==
          'Fictional private note',
      'note persisted',
    );
    for (final report in [
      'summary',
      'daily',
      'top-pages',
      'top-entries',
      'referrers',
    ]) {
      final result = await api.get(
        'admin/analytics/$report',
        query: UtcDateRange.recent().query,
      );
      AnalyticsMeta.fromJson(Map<String, dynamic>.from(result['meta'] as Map));
      if (report == 'summary') {
        Totals.fromJson(Map<String, dynamic>.from(result['data'] as Map));
      }
    }
    check((await api.list(Resource.audit)).meta.total > 0, 'audit events');
    stdout.writeln(
      'PASS: image processing/URL, entry publish/public/unpublish, relations, team/services/taxonomies, settings, inquiries, five analytics reports and audit.',
    );
  } finally {
    if (settingsChanged) {
      await api.putSettings(WritePayload('SettingsCreate', settingsPayload()));
    }
    for (final r in [
      Resource.inquiries,
      Resource.entries,
      Resource.team,
      Resource.services,
      Resource.categories,
      Resource.technologies,
      Resource.media,
    ]) {
      for (final id in created[r] ?? <int>[]) {
        try {
          if (r == Resource.entries) {
            await api.save(
              r,
              WritePayload('EntryPatch', {'status': 'draft'}),
              id: id,
            );
          }
          await api.delete(r, id);
        } on ApiFailure catch (e) {
          if (e.status != 404) rethrow;
        }
      }
    }
    await api.logout();
    try {
      await api.me();
      throw StateError('Logout did not revoke');
    } on ApiFailure catch (e) {
      check(e.status == 401, 'logout revoked');
    }
    stdout.writeln(
      'PASS: test-created entities cleaned up; logout revoked token.',
    );
  }
}
