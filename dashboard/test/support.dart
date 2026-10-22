import 'package:portfolio_api/portfolio_api.dart';
import 'package:portfolio_admin/core/session.dart';

class MemoryStore implements CredentialStore {
  String? value;
  bool failRead = false, failWrite = false;
  @override
  Future<String?> read() async {
    if (failRead) throw StateError('keystore unavailable');
    return value;
  }

  @override
  Future<void> write(String v) async {
    if (failWrite) throw StateError('keystore unavailable');
    value = v;
  }

  @override
  Future<void> clear() async {
    value = null;
  }
}

class FakeApi extends PortfolioApi {
  Object? meError, loginError, logoutError;
  int logoutCalls = 0;
  bool passwordChanged = false;
  FakeApi() : super('https://example.test/api/v1', credentials: () => null);
  @override
  Future<User> me() async {
    if (meError != null) throw meError!;
    return const User(
      id: 1,
      name: 'Fictional owner',
      email: 'owner@example.test',
    );
  }

  @override
  Future<LoginResult> login(String email, String password) async {
    if (loginError != null) throw loginError!;
    return LoginResult(
      token: 'test-token-not-live',
      token_type: 'Bearer',
      expires_at: DateTime.now()
          .toUtc()
          .add(const Duration(days: 1))
          .toIso8601String(),
      user: await me(),
    );
  }

  @override
  Future<void> logout({bool all = false}) async {
    logoutCalls++;
    if (logoutError != null) throw logoutError!;
  }

  @override
  Future<void> password(WritePayload payload) async {
    passwordChanged = true;
  }

  @override
  Future<Json> get(String path, {Json? query, CancelToken? cancel}) async {
    if (path.endsWith('summary')) {
      return {
        'data': {'page_view': 0, 'entry_view': 12, 'contact_click': 3},
        'meta': {'retention_days': 90},
      };
    }
    return {
      'data': <Json>[],
      'meta': {'current_page': 1, 'per_page': 20, 'last_page': 1, 'total': 42},
    };
  }

  @override
  Future<ApiPage> list(Resource r, {Json? query, CancelToken? cancel}) async =>
      ApiPage(
        [],
        const PaginationMeta(
          current_page: 1,
          per_page: 20,
          last_page: 1,
          total: 0,
        ),
      );
}
