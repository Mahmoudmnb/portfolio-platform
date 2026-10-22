import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_admin/core/session.dart';
import 'package:portfolio_api/portfolio_api.dart';

import 'support.dart';

void main() {
  late MemoryStore store;
  late FakeApi api;
  late OwnerSession session;
  setUp(() {
    store = MemoryStore();
    api = FakeApi();
    session = OwnerSession(
      'https://example.test/api/v1',
      store: store,
      client: api,
    );
  });
  Future<void> seed() async {
    await session.login('owner@example.test', 'secret');
  }

  test('startup with no credential only shows login', () async {
    await session.bootstrap();
    expect(session.state, SessionState.signedOut);
  });
  test('stored login is validated with me', () async {
    await seed();
    await session.bootstrap();
    expect(session.state, SessionState.authenticated);
    expect(session.user?.id, 1);
    expect(store.value, isNot(contains('secret')));
  });
  test('offline startup retains token without exposing screens', () async {
    await seed();
    api.meError = const ApiFailure('Offline');
    await session.bootstrap();
    expect(session.state, SessionState.offline);
    expect(store.value, isNotNull);
  });
  test(
    'revoked token and forbidden owner differ from network failure',
    () async {
      await seed();
      api.meError = const ApiFailure('Expired', status: 401);
      await session.bootstrap();
      expect(session.state, SessionState.expired);
      api.meError = const ApiFailure('Disabled', status: 403);
      await session.bootstrap();
      expect(session.state, SessionState.forbidden);
    },
  );
  test('expired local credential never exposes private UI', () async {
    store.value = jsonEncode({
      'token': 'test',
      'base': api.base.toString(),
      'expires_at': '2020-01-01T00:00:00Z',
    });
    await session.bootstrap();
    expect(session.state, SessionState.expired);
  });
  test('keystore read failure clears corrupt storage', () async {
    store.value = 'invalid';
    store.failRead = true;
    await session.bootstrap();
    expect(session.state, SessionState.signedOut);
    expect(store.value, isNull);
  });
  test('keystore write failure revokes unpersisted token', () async {
    store.failWrite = true;
    await expectLater(seed(), throwsA(isA<ApiFailure>()));
    expect(api.logoutCalls, 1);
    expect(session.state, isNot(SessionState.authenticated));
  });
  test('login 401 stays on sign-in without a session', () async {
    api.loginError = const ApiFailure('Invalid credentials', status: 401);
    await expectLater(seed(), throwsA(isA<ApiFailure>()));
    expect(session.state, isNot(SessionState.authenticated));
  });
  test(
    'failed revocation keeps session until explicit local-only sign out',
    () async {
      await seed();
      api.logoutError = const ApiFailure('Offline');
      await expectLater(session.logout(), throwsA(isA<ApiFailure>()));
      expect(session.state, SessionState.authenticated);
      await session.clear();
      expect(session.state, SessionState.signedOut);
      expect(store.value, isNull);
    },
  );
  test(
    'logout clears credentials forms and increments private generation',
    () async {
      await seed();
      session.drafts['entries/new'] = {'title': 'Private'};
      await session.logout(all: true);
      expect(store.value, isNull);
      expect(session.drafts, isEmpty);
      expect(session.privateGeneration, 1);
    },
  );
  test('expiry preserves nonsecret forms in memory; cancel purges', () async {
    await seed();
    session.drafts['entries/new'] = {'title': 'Unsent'};
    session.expire();
    session.expire();
    expect(session.drafts, isNotEmpty);
    expect(session.privateGeneration, 1);
    await session.clear();
    expect(session.drafts, isEmpty);
  });
  test('password success revokes session and clears memory', () async {
    await seed();
    await session.changePassword(
      WritePayload('PasswordUpdate', {
        'current_password': 'old',
        'password': 'NewPassword123',
        'password_confirmation': 'NewPassword123',
      }),
    );
    expect(api.passwordChanged, isTrue);
    expect(session.state, SessionState.signedOut);
    expect(store.value, isNull);
  });
  test('server mismatch clears persisted credential', () async {
    store.value = jsonEncode({
      'token': 'test',
      'base': 'https://other.test/api/v1',
      'expires_at': '2030-01-01T00:00:00Z',
    });
    session.drafts['entries/new'] = {'title': 'Development-only draft'};
    await session.bootstrap();
    expect(session.state, SessionState.signedOut);
    expect(store.value, isNull);
    expect(session.drafts, isEmpty);
    expect(session.user, isNull);
    expect(session.privateGeneration, 1);
  });
}
