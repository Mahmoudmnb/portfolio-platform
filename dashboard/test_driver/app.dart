// Separate debug-only entry point. Never use this target for distribution.
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_admin/app/app.dart';
import 'package:portfolio_admin/core/session.dart';
import 'package:portfolio_api/portfolio_api.dart';

Future<void> main() async {
  const base = String.fromEnvironment('API_BASE_URL');
  if (!['127.0.0.1', 'localhost', '10.0.2.2'].contains(Uri.parse(base).host)) {
    throw StateError('Driver target requires a disposable local API');
  }
  final session = OwnerSession(base);
  final created = <Resource, List<int>>{};
  final uiErrors = <String>[];
  final originalError = FlutterError.onError;
  FlutterError.onError = (details) {
    uiErrors.add(
      '${details.exception.runtimeType}: ${details.exceptionAsString().split('\n').first}',
    );
    originalError?.call(details);
  };
  enableFlutterDriverExtension(
    handler: (message) async {
      final request = jsonDecode(message!) as Map;
      switch (request['action']) {
        case 'metrics':
          final view = WidgetsBinding.instance.platformDispatcher.views.first;
          return jsonEncode({
            'width': view.physicalSize.width / view.devicePixelRatio,
            'height': view.physicalSize.height / view.devicePixelRatio,
            'dpr': view.devicePixelRatio,
            'top_inset': view.viewPadding.top / view.devicePixelRatio,
            'bottom_inset': view.viewPadding.bottom / view.devicePixelRatio,
          });
        case 'ui-errors':
          return jsonEncode(uiErrors);
        case 'expire':
          session.expire();
          return 'expired';
        case 'prepare-visuals':
          final api = session.api;
          final dir = await Directory.systemTemp.createTemp(
            'bannan-finishing-fixture-',
          );
          final image = File('${dir.path}/fixture.png');
          await image.writeAsBytes(base64Decode(request['image'] as String));
          try {
            var media = await api.upload(image.path, 'finishing-cover.png');
            created.putIfAbsent(Resource.media, () => []).add(media.id);
            final deadline = DateTime.now().add(const Duration(minutes: 2));
            while (media.status == 'processing' &&
                DateTime.now().isBefore(deadline)) {
              await Future<void>.delayed(const Duration(seconds: 2));
              media = AdminMedia.fromJson(
                await api.detail(Resource.media, media.id),
              );
            }
            if (media.status != 'ready') {
              throw StateError('Fixture image processing did not finish');
            }
            final entry = await api.save(
              Resource.entries,
              WritePayload('EntryCreate', {
                'kind': 'project',
                'title': 'Field notes',
                'summary': 'A fictional offline-first Flutter notebook.',
                'description':
                    'A lightweight fictional notebook built with Flutter.',
                'cover_media_id': media.id,
              }),
            );
            created
                .putIfAbsent(Resource.entries, () => [])
                .add(entry['id'] as int);
            return 'prepared';
          } finally {
            await dir.delete(recursive: true);
          }
        case 'record-picker-media':
          final items =
              (await session.api.list(Resource.media, query: {'per_page': 100}))
                  .items
                  .where(
                    (e) => e['original_filename'] == 'finishing-picker.png',
                  )
                  .toList();
          if (items.length != 1 || items.single['status'] != 'ready') {
            throw StateError('Picker upload did not reach ready exactly once');
          }
          created
              .putIfAbsent(Resource.media, () => [])
              .add(items.single['id'] as int);
          return 'picker ready exactly once';
        case 'cleanup-visuals':
          for (final r in [Resource.entries, Resource.media]) {
            for (final id in created[r] ?? <int>[]) {
              if (r == Resource.entries) {
                await session.api.save(
                  r,
                  WritePayload('EntryPatch', {'status': 'draft'}),
                  id: id,
                );
              }
              await session.api.delete(r, id);
            }
          }
          created.clear();
          return 'cleaned';
        case 'reset':
          await session.clear();
          return 'reset';
        case 'validate-storage':
          final fresh = OwnerSession(
            const String.fromEnvironment('API_BASE_URL'),
          );
          await fresh.bootstrap();
          if (fresh.state != SessionState.authenticated ||
              fresh.user?.id != session.user?.id) {
            throw StateError('Secure Android bootstrap failed');
          }
          fresh.api.cancelSession();
          return 'validated';
        case 'slice':
          final api = session.api;
          final dir = await Directory.systemTemp.createTemp(
            'bannan-device-test-',
          );
          final image = File('${dir.path}/fixture.png');
          await image.writeAsBytes(base64Decode(request['image'] as String));
          int? mediaId, entryId;
          try {
            var media = await api.upload(image.path, 'fictional-device.png');
            mediaId = media.id;
            final deadline = DateTime.now().add(const Duration(minutes: 2));
            while (media.status == 'processing' &&
                DateTime.now().isBefore(deadline)) {
              await Future<void>.delayed(const Duration(seconds: 2));
              media = AdminMedia.fromJson(
                await api.detail(Resource.media, media.id),
              );
            }
            if (media.status != 'ready') throw StateError('Image not ready');
            final http = HttpClient();
            final response = await (await http.getUrl(Uri.parse(media.url!)))
                .close();
            if (response.statusCode != 200) {
              throw StateError('Device cannot reach media URL');
            }
            await response.drain<void>();
            http.close();
            final entry = await api.save(
              Resource.entries,
              WritePayload('EntryCreate', {
                'kind': 'project',
                'title': 'Fictional Android verification',
                'summary': 'Disposable runtime fixture',
                'description': 'Created by the Android API flow',
                'cover_media_id': media.id,
                'gallery': [
                  {
                    'media_id': media.id,
                    'alt_text': 'Fictional image',
                    'sort_order': 0,
                  },
                ],
              }),
            );
            entryId = entry['id'] as int;
            await api.save(
              Resource.entries,
              WritePayload('EntryPatch', {'status': 'published'}),
              id: entryId,
            );
            await api.request(
              'GET',
              'entries/${entry['slug']}',
              protected: false,
            );
            await api.save(
              Resource.entries,
              WritePayload('EntryPatch', {'status': 'draft'}),
              id: entryId,
            );
            try {
              await api.request(
                'GET',
                'entries/${entry['slug']}',
                protected: false,
              );
              throw StateError('Unpublish did not hide');
            } on ApiFailure catch (e) {
              if (e.status != 404) rethrow;
            }
            return 'slice passed';
          } finally {
            if (entryId != null) {
              await api.save(
                Resource.entries,
                WritePayload('EntryPatch', {'status': 'draft'}),
                id: entryId,
              );
              await api.delete(Resource.entries, entryId);
            }
            if (mediaId != null) await api.delete(Resource.media, mediaId);
            await dir.delete(recursive: true);
          }
        case 'logout':
          await session.logout();
          return 'signed out';
        default:
          throw StateError('Unknown test action');
      }
    },
  );
  runApp(
    ProviderScope(
      overrides: [sessionProvider.overrideWithValue(session)],
      child: DashboardApp(session: session),
    ),
  );
  await session.bootstrap();
}
