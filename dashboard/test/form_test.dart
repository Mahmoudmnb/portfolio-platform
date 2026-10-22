import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_admin/app/theme.dart';
import 'package:portfolio_admin/core/session.dart';
import 'package:portfolio_admin/core/ui.dart';
import 'package:portfolio_admin/features/editor.dart';
import 'package:portfolio_api/portfolio_api.dart';

import 'support.dart';

class SavingApi extends FakeApi {
  final writes = <Json>[];
  Object? failure;
  @override
  Future<Json> save(Resource r, WritePayload payload, {int? id}) async {
    if (failure != null) throw failure!;
    writes.add(payload.toJson());
    return {'id': 7, ...payload.toJson()};
  }
}

void main() {
  Future<SavingApi> open(WidgetTester tester) async {
    final api = SavingApi();
    final session = OwnerSession(
      'https://example.test/api/v1',
      store: MemoryStore(),
      client: api,
    );
    await tester.pumpWidget(
      ProviderScope(
        overrides: [sessionProvider.overrideWithValue(session)],
        child: MaterialApp(
          theme: brandTheme(),
          home: Builder(
            builder: (context) => Scaffold(
              body: TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (_) => const EditorScreen('entries'),
                  ),
                ),
                child: const Text('Open editor'),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('Open editor'));
    await tester.pumpAndSettle();
    return api;
  }

  Future<void> fill(WidgetTester tester, String key, String value) async {
    await tester.scrollUntilVisible(
      find.byKey(ValueKey('field-$key')),
      200,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.enterText(find.byKey(ValueKey('field-$key')), value);
    await tester.pump();
  }

  testWidgets('entry create saves typed draft once and pops after success', (
    tester,
  ) async {
    final api = await open(tester);
    await fill(tester, 'title', 'Fictional project');
    await fill(tester, 'summary', 'Test summary');
    await fill(tester, 'description', 'Test description');
    await tester.scrollUntilVisible(
      find.text('Save changes'),
      300,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.tap(find.text('Save changes'));
    await tester.pumpAndSettle();
    expect(api.writes.length, 1);
    expect(api.writes.single['status'], 'draft');
    expect(api.writes.single.containsKey('seo_title'), isFalse);
    expect(find.text('Open editor'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
  testWidgets(
    'dirty system back requires confirmation and discard clears draft',
    (tester) async {
      await open(tester);
      await fill(tester, 'title', 'Unsent');
      await tester.binding.handlePopRoute();
      await tester.pumpAndSettle();
      expect(find.text('Discard unsaved changes?'), findsOneWidget);
      await tester.tap(find.text('Discard'));
      await tester.pumpAndSettle();
      expect(find.text('Open editor'), findsOneWidget);
    },
  );
  testWidgets(
    'validation preserves input and announces missing required fields',
    (tester) async {
      final api = await open(tester);
      await fill(tester, 'title', 'Keep me');
      await tester.scrollUntilVisible(
        find.text('Save changes'),
        300,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.tap(find.text('Save changes'));
      await tester.pumpAndSettle();
      expect(api.writes, isEmpty);
      expect(find.textContaining('Summary: Required'), findsOneWidget);
      expect(find.textContaining('Description: Required'), findsOneWidget);
      expect(tester.takeException(), isNull);
    },
  );
  testWidgets('429 retry is disabled until advertised interval', (
    tester,
  ) async {
    var retries = 0;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ErrorPanel(
            const ApiFailure(
              'Wait',
              status: 429,
              retryAfter: Duration(seconds: 2),
            ),
            retry: () => retries++,
          ),
        ),
      ),
    );
    await tester.tap(find.text('Retry in 2 seconds'));
    expect(retries, 0);
    await tester.pump(const Duration(seconds: 2));
    await tester.tap(find.text('Retry'));
    expect(retries, 1);
  });
}
