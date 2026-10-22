import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_admin/app/theme.dart';
import 'package:portfolio_admin/core/session.dart';
import 'package:portfolio_admin/features/media.dart';
import 'package:portfolio_api/portfolio_api.dart';

import 'support.dart';

class MediaApi extends FakeApi {
  String status = 'processing';
  int checks = 0;
  @override
  Future<Json> detail(Resource r, int id, {CancelToken? cancel}) async {
    checks++;
    return {
      'id': id,
      'status': status,
      'width': 20,
      'height': 20,
      'bytes': 80,
      'usage_count': 0,
      'original_filename': 'Fictional.png',
      'failure_message': status == 'failed' ? 'Unable to process' : null,
      'url': null,
      'thumbnail_url': null,
    };
  }
}

void main() {
  Future<void> open(WidgetTester tester, MediaApi api) async {
    final s = OwnerSession(
      'https://example.test/api/v1',
      store: MemoryStore(),
      client: api,
    );
    await tester.pumpWidget(
      ProviderScope(
        overrides: [sessionProvider.overrideWithValue(s)],
        child: MaterialApp(
          theme: brandTheme(),
          home: const MediaDetailScreen(1),
        ),
      ),
    );
    await tester.pump();
  }

  testWidgets('processing polls with backoff; background and dispose cancel', (
    tester,
  ) async {
    final api = MediaApi();
    await open(tester, api);
    expect(api.checks, 1);
    expect(
      find.textContaining('Upload received. Processing on the server'),
      findsOneWidget,
    );
    await tester.pump(const Duration(seconds: 2));
    await tester.pump();
    expect(api.checks, 2);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);
    await tester.pump(const Duration(seconds: 10));
    expect(api.checks, 2);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    await tester.pump();
    expect(api.checks, 3);
    await tester.pumpWidget(const SizedBox());
    await tester.pump(const Duration(seconds: 20));
    expect(api.checks, 3);
    expect(tester.takeException(), isNull);
  });
  testWidgets('slow processing stops polling and Check again resumes safely', (
    tester,
  ) async {
    final api = MediaApi();
    await open(tester, api);
    for (var i = 0; i < 28; i++) {
      await tester.pump(const Duration(seconds: 5));
      await tester.pump();
    }
    expect(find.textContaining('Processing is taking longer'), findsOneWidget);
    expect(find.text('Status: Processing'), findsOneWidget);
    expect(find.text('Processing failed. Upload a new image.'), findsNothing);
    final checks = api.checks;
    await tester.pump(const Duration(minutes: 2));
    expect(api.checks, checks);
    api.status = 'ready';
    await tester.ensureVisible(find.text('Check again'));
    await tester.tap(find.text('Check again'));
    await tester.pump();
    expect(api.checks, checks + 1);
    expect(find.text('Status: Ready'), findsOneWidget);
    await tester.pump(const Duration(seconds: 20));
    expect(api.checks, checks + 1);
  });
  testWidgets(
    'terminal failure offers new upload guidance without processing retry',
    (tester) async {
      final api = MediaApi()..status = 'failed';
      await open(tester, api);
      await tester.pump(const Duration(seconds: 20));
      expect(api.checks, 1);
      expect(
        find.text('Processing failed. Upload a new image.'),
        findsOneWidget,
      );
      expect(find.text('Retry processing'), findsNothing);
      expect(tester.takeException(), isNull);
    },
  );
}
