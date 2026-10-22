import 'dart:ui' show SemanticsAction;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_api/portfolio_api.dart';
import 'package:portfolio_admin/app/app.dart';
import 'package:portfolio_admin/app/theme.dart';
import 'package:portfolio_admin/core/session.dart';
import 'package:portfolio_admin/features/auth.dart';
import 'package:portfolio_admin/features/editor.dart';
import 'package:portfolio_admin/features/reports.dart';

import 'support.dart';

void main() {
  for (final width in [360.0, 412.0, 840.0]) {
    for (final scale in [1.0, 2.0]) {
      testWidgets('login and overview fit width $width scale $scale', (
        tester,
      ) async {
        tester.view.physicalSize = Size(width, 892);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);
        final session = OwnerSession(
          'https://example.test/api/v1',
          store: MemoryStore(),
          client: FakeApi(),
        );
        Widget app(Widget screen) => ProviderScope(
          overrides: [sessionProvider.overrideWithValue(session)],
          child: MaterialApp(
            theme: brandTheme(),
            builder: (c, child) => MediaQuery(
              data: MediaQuery.of(c)
                  .copyWith(textScaler: TextScaler.linear(scale)),
              child: child!,
            ),
            home: screen,
          ),
        );
        await tester.pumpWidget(app(const LoginScreen()));
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
        expect(find.text('Email'), findsOneWidget);
        expect(find.byTooltip('Show password'), findsOneWidget);
        await tester.pumpWidget(app(const OverviewScreen()));
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
        expect(find.byKey(const ValueKey('total-page_view')), findsOneWidget);
        await tester.scrollUntilVisible(
          find.byKey(const ValueKey('count-entries')),
          150,
        );
        expect(find.byKey(const ValueKey('count-entries')), findsOneWidget);
        await tester.scrollUntilVisible(
          find.byKey(const ValueKey('count-inquiries')),
          150,
        );
        expect(find.byKey(const ValueKey('count-inquiries')), findsOneWidget);
        expect(
          tester
              .widget<Semantics>(find.byKey(const ValueKey('count-entries')))
              .properties
              .label,
          '42 draft entries',
        );
        expect(
          tester
              .widget<Semantics>(find.byKey(const ValueKey('count-inquiries')))
              .properties
              .label,
          '42 new inquiries',
        );
        expect(tester.takeException(), isNull);
      });
    }
  }
  testWidgets('guard hides private content until startup validation', (
    tester,
  ) async {
    final session = OwnerSession(
      'https://example.test/api/v1',
      store: MemoryStore(),
      client: FakeApi(),
    );
    await tester.pumpWidget(
      ProviderScope(
        overrides: [sessionProvider.overrideWithValue(session)],
        child: DashboardApp(session: session),
      ),
    );
    await tester.pump();
    expect(find.text('Studio overview'), findsNothing);
    await session.bootstrap();
    await tester.pumpAndSettle();
    expect(find.text('Sign in'), findsOneWidget);
    expect(find.text('Studio overview'), findsNothing);
  });
  testWidgets('large-text authenticated navigation wraps without clipping', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(360, 892);
    tester.view.devicePixelRatio = 1;
    tester.platformDispatcher.textScaleFactorTestValue = 2;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);
    final session = OwnerSession(
      'https://example.test/api/v1',
      store: MemoryStore(),
      client: FakeApi(),
    );
    await session.login('owner@example.test', 'fixture');
    await tester.pumpWidget(
      ProviderScope(
        overrides: [sessionProvider.overrideWithValue(session)],
        child: DashboardApp(session: session),
      ),
    );
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    final semantics = tester.ensureSemantics();
    expect(
      tester
          .getSemantics(find.bySemanticsLabel('More'))
          .getSemanticsData()
          .hasAction(SemanticsAction.tap),
      isTrue,
    );
    await tester.tap(find.text('More'));
    await tester.pumpAndSettle();
    expect(find.text('Manage your studio'), findsOneWidget);
    semantics.dispose();
    expect(tester.takeException(), isNull);
  });
  test('every writable content field has explicit UI or visibility action', () {
    for (final path in formSections.keys) {
      final schema = path == 'site-settings'
          ? 'SettingsCreate'
          : path == 'inquiries'
          ? 'InquiryUpdate'
          : '${Resource.values.firstWhere((r) => r.path == path).schema}Create';
      final fields = formSections[path]!.values.expand((v) => v).toSet();
      if (path == 'entries') fields.addAll(['status', 'published_at']);
      expect(
        fields,
        containsAll((writeSchemas[schema]!['properties'] as Map).keys),
        reason: path,
      );
    }
  });
  test('entry response mapping keeps relationship IDs and excludes read-only fields', () {
    final values = writableValues('entries', {
      'id': 1,
      'title': 'Title',
      'seo_title': 'Derived',
      'cover_media_id': 8,
      'technologies': [
        {'id': 40},
      ],
      'contributors': [
        {'id': 70},
      ],
      'gallery': [
        {
          'media': {'id': 8},
          'alt_text': 'Screen',
          'sort_order': 2,
        },
      ],
    });
    expect(values['technology_ids'], [40]);
    expect(values['contributor_ids'], [70]);
    expect(values['gallery'], [
      {'media_id': 8, 'alt_text': 'Screen', 'sort_order': 2},
    ]);
    expect(values.containsKey('seo_title'), isFalse);
    expect(values.containsKey('id'), isFalse);
  });
}
