import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_api/portfolio_api.dart';

abstract interface class CredentialStore {
  Future<String?> read();
  Future<void> write(String value);
  Future<void> clear();
}

class SecureCredentials implements CredentialStore {
  final FlutterSecureStorage storage;
  SecureCredentials([this.storage = const FlutterSecureStorage()]);
  @override
  Future<String?> read() => storage.read(key: 'owner_session');
  @override
  Future<void> write(String value) =>
      storage.write(key: 'owner_session', value: value);
  @override
  Future<void> clear() => storage.deleteAll();
}

enum SessionState {
  checking,
  signedOut,
  authenticated,
  offline,
  expired,
  forbidden,
}

class OwnerSession extends ChangeNotifier {
  final CredentialStore store;
  late final PortfolioApi api;
  String? _token;
  User? user;
  SessionState state = SessionState.checking;
  Object? error;
  int epoch = 0;
  int privateGeneration = 0;
  int revision = 0;
  final drafts = <String, Map<String, dynamic>>{};
  int? _draftOwner;
  OwnerSession(
    String base, {
    CredentialStore? store,
    PortfolioApi? client,
    bool release = false,
  }) : store = store ?? SecureCredentials() {
    api =
        client ??
        PortfolioApi(
          base,
          credentials: () => _token,
          onUnauthorized: expire,
          onMutation: () {
            revision++;
            notifyListeners();
          },
          release: release,
        );
  }
  Future<void> bootstrap() async {
    state = SessionState.checking;
    error = null;
    notifyListeners();
    try {
      final raw = await store.read();
      if (raw == null) {
        state = SessionState.signedOut;
        notifyListeners();
        return;
      }
      final saved = jsonDecode(raw) as Map;
      if (saved['base'] != api.base.toString()) {
        await clear();
        return;
      }
      _token = saved['token'] as String;
      if (DateTime.parse(saved['expires_at'] as String)
          .isBefore(DateTime.now().toUtc())) {
        expire();
        return;
      }
      user = await api.me();
      _draftOwner = user!.id;
      state = SessionState.authenticated;
    } on ApiFailure catch (e) {
      error = e;
      state = e.status == 401
          ? SessionState.expired
          : e.status == 403
          ? SessionState.forbidden
          : SessionState.offline;
    } catch (_) {
      _token = null;
      drafts.clear();
      try {
        await store.clear();
      } catch (_) {}
      error = 'Secure storage could not be opened. Sign in again.';
      state = SessionState.signedOut;
    }
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    final result = await api.login(email, password);
    try {
      await store.write(
        jsonEncode({
          'token': result.token,
          'expires_at': result.expires_at,
          'base': api.base.toString(),
        }),
      );
    } catch (_) {
      // Do not retain an unpersisted credential or fall back to plaintext.
      _token = result.token;
      api.newSession();
      try {
        await api.logout();
      } catch (_) {}
      _token = null;
      api.cancelSession();
      throw const ApiFailure(
        'Secure storage is unavailable. Sign-in was not retained.',
        code: 'storage',
      );
    }
    if (_draftOwner != null && _draftOwner != result.user.id) drafts.clear();
    _draftOwner = result.user.id;
    user = result.user;
    _token = result.token;
    api.newSession();
    epoch++;
    error = null;
    state = SessionState.authenticated;
    notifyListeners();
  }

  void expire() {
    if (state == SessionState.expired) return;
    api.cancelSession();
    _token = null;
    user = null;
    epoch++;
    privateGeneration++;
    state = SessionState.expired;
    notifyListeners();
  }

  Future<void> clear() async {
    api.cancelSession();
    _token = null;
    user = null;
    drafts.clear();
    privateGeneration++;
    _draftOwner = null;
    epoch++;
    state = SessionState.signedOut;
    try {
      await store.clear();
    } catch (_) {
      error = 'Device credentials could not be removed. Clear this app’s storage in Android Settings before signing in again.';
    }
    notifyListeners();
  }

  Future<void> logout({bool all = false}) async {
    await api.logout(all: all);
    await clear();
  }

  Future<void> changePassword(WritePayload payload) async {
    await api.password(payload);
    await clear();
  }
}

final sessionProvider = Provider<OwnerSession>(
  (ref) => throw StateError('Session must be injected'),
);
final apiProvider = Provider<PortfolioApi>(
  (ref) => ref.watch(sessionProvider).api,
);
