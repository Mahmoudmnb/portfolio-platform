import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_admin/app/theme.dart';
import 'package:portfolio_admin/core/session.dart';
import 'package:portfolio_admin/features/auth.dart';
import 'package:portfolio_admin/features/editor.dart';
import 'package:portfolio_admin/features/resource_list.dart';
import 'package:portfolio_api/portfolio_api.dart';

import 'support.dart';

void main() {
  test(
    'production configuration rejects documentation placeholders and HTTP',
    () {
      for (final url in [
        '',
        'http://api.bannan.studio/api/v1',
        'https://api.example.test/api/v1',
        'https://example.com/api/v1',
        'https://your-api-host/api/v1',
        'https://localhost/api/v1',
      ]) {
        expect(
          () => PortfolioApi(url, credentials: () => null, release: true),
          throwsArgumentError,
        );
      }
      expect(
        PortfolioApi(
          'https://api.bannan.studio/api/v1',
          credentials: () => null,
          release: true,
        ).base.scheme,
        'https',
      );
    },
  );
  testWidgets(
    'an open content list reloads after a mutation from another screen',
    (tester) async {
      final api = CountingApi();
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
            home: const ResourceListScreen(Resource.entries),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(api.calls, 1);
      session.revision++;
      session.notifyListeners();
      await tester.pumpAndSettle();
      expect(api.calls, 2);
      await tester.pumpWidget(const SizedBox());
      session.dispose();
    },
  );
  testWidgets(
    'login tap targets, labels and contrast satisfy automated Android guidelines',
    (tester) async {
      final semantics = tester.ensureSemantics();
      tester.view.physicalSize = const Size(412, 892);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      final session = OwnerSession(
        'https://example.test/api/v1',
        store: MemoryStore(),
        client: FakeApi(),
      );
      await tester.pumpWidget(
        ProviderScope(
          overrides: [sessionProvider.overrideWithValue(session)],
          child: MaterialApp(theme: brandTheme(), home: const LoginScreen()),
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
      await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
      await expectLater(tester, meetsGuideline(textContrastGuideline));
      semantics.dispose();
    },
  );
  testWidgets(
    'publish review keeps ready checks and back/cancel separate from publication',
    (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: brandTheme(),
          home: Builder(
            builder: (context) => Scaffold(
              body: TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute<bool>(
                    builder: (_) => const PublishReviewScreen(
                      entry: {'title': 'Fictional project', 'kind': 'project'},
                    ),
                  ),
                ),
                child: const Text('Review'),
              ),
            ),
          ),
        ),
      );
      await tester.tap(find.text('Review'));
      await tester.pumpAndSettle();
      expect(find.text('Ready to go live?'), findsOneWidget);
      expect(find.text('Cover image ready'), findsOneWidget);
      await tester.tap(find.text('Keep as draft'));
      await tester.pumpAndSettle();
      expect(find.text('Review'), findsOneWidget);
    },
  );
}

class CountingApi extends FakeApi {
  int calls = 0;
  @override
  Future<ApiPage> list(Resource r, {Json? query, CancelToken? cancel}) {
    calls++;
    return super.list(r, query: query, cancel: cancel);
  }
}
