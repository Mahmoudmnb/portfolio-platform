import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:portfolio_api/portfolio_api.dart';
import 'package:test/test.dart';

class Adapter implements HttpClientAdapter {
  final Future<ResponseBody> Function(RequestOptions) respond;
  final requests = <RequestOptions>[];
  Adapter(this.respond);
  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? stream,
    Future<void>? cancelFuture,
  ) {
    requests.add(options);
    return respond(options);
  }

  @override
  void close({bool force = false}) {}
}

ResponseBody jsonBody(
  Object body, {
  int status = 200,
  Map<String, List<String>>? headers,
}) => ResponseBody.fromString(
  jsonEncode(body),
  status,
  headers:
      headers ??
      {
        'content-type': ['application/json'],
      },
);
void main() {
  test(
    'production login and protected endpoints contain one API prefix',
    () async {
      final adapter = Adapter(
        (o) async => jsonBody({
          'data': o.path.endsWith('login')
              ? {
                  'token': 'fictional-token',
                  'token_type': 'Bearer',
                  'expires_at': '2030-01-01T00:00:00Z',
                  'user': {
                    'id': 1,
                    'name': 'Owner',
                    'email': 'owner@example.test',
                  },
                }
              : {'id': 1, 'name': 'Owner', 'email': 'owner@example.test'},
        }),
      );
      final api = PortfolioApi(
        'https://api.mahmoudbannan.com/api/v1',
        release: true,
        credentials: () => 'fictional-token',
        dio: Dio()..httpClientAdapter = adapter,
      );
      await api.login('owner@example.test', 'fictional-password');
      await api.me();
      expect(
        adapter.requests[0].uri.toString(),
        'https://api.mahmoudbannan.com/api/v1/admin/auth/login',
      );
      expect(adapter.requests[0].headers.containsKey('Authorization'), isFalse);
      expect(
        adapter.requests[1].uri.toString(),
        'https://api.mahmoudbannan.com/api/v1/admin/auth/me',
      );
      expect(
        adapter.requests[1].headers['Authorization'],
        'Bearer fictional-token',
      );
      expect(adapter.requests.every((r) => !r.followRedirects), isTrue);
    },
  );
  test(
    'production media stays absolute, HTTPS, and separate from API paths',
    () {
      final base = Uri.parse('https://api.mahmoudbannan.com/api/v1');
      expect(
        safeMediaUrl(
          'https://api.mahmoudbannan.com/storage/image.webp',
          apiBase: base,
        ),
        isTrue,
      );
      expect(
        safeMediaUrl('https://cdn.mahmoudbannan.com/image.webp', apiBase: base),
        isTrue,
      );
      expect(
        safeMediaUrl(
          'http://api.mahmoudbannan.com/storage/image.webp',
          apiBase: base,
        ),
        isFalse,
      );
      expect(safeMediaUrl('/storage/image.webp', apiBase: base), isFalse);
      expect(
        safeMediaUrl(
          'https://token@cdn.mahmoudbannan.com/image.webp',
          apiBase: base,
        ),
        isFalse,
      );
      expect(
        safeMediaUrl(
          'http://10.0.2.2:8000/storage/image.webp',
          apiBase: Uri.parse('http://10.0.2.2:8000/api/v1'),
        ),
        isTrue,
      );
      for (final url in [
        'http://api.mahmoudbannan.com/api/v1',
        'https://10.0.2.2/api/v1',
        'https://api.mahmoudbannan.com/api/v1/api/v1',
      ]) {
        expect(
          () => PortfolioApi(url, release: true, credentials: () => null),
          throwsArgumentError,
        );
      }
    },
  );
  test('all supplied integration JSON fixtures are envelopes', () {
    final files = Directory('test/fixtures')
        .listSync()
        .whereType<File>()
        .toList();
    expect(files, isNotEmpty);
    for (final file in files) {
      final json = jsonDecode(file.readAsStringSync()) as Map;
      expect(json.containsKey('data') || json.containsKey('message'), isTrue);
    }
  });
  test('public entry example parses nested nullable media and taxonomy', () {
    final json = jsonDecode(
      File('test/fixtures/integration-0.json').readAsStringSync(),
    ) as Json;
    final row = EntrySummary.fromJson(
      Map<String, dynamic>.from((json['data'] as List).first as Map),
    );
    expect(row.title, 'Field notes');
    expect(row.cover?.width, 20);
    expect(row.repository_url, isNull);
    expect(row.technologies.single.slug, 'flutter');
  });
  test('optional response link order remains nullable', () {
    expect(
      Link.fromJson({'label': 'Website', 'url': 'https://example.test'})
          .sort_order,
      isNull,
    );
  });
  test('malformed integer form input is never silently replaced', () {
    expect(
      WritePayload('CategoryPatch', {'sort_order': 'invalid'}).validate(),
      contains('sort_order'),
    );
  });
  test(
    'successful protected mutations invalidate dependent views; reads do not',
    () async {
      var changes = 0;
      final dio = Dio()
        ..httpClientAdapter = Adapter((o) async => jsonBody({'data': {}}));
      final api = PortfolioApi(
        'https://example.test/api/v1',
        credentials: () => null,
        dio: dio,
        onMutation: () => changes++,
      );
      await api.get('admin/entries');
      expect(changes, 0);
      await api.request('PATCH', 'admin/entries/1', body: {'title': 'New'});
      expect(changes, 1);
    },
  );
  group('write semantics', () {
    test('PATCH omission null and empty are independent', () {
      final p = WritePayload('EntryPatch', {
        'category_id': null,
        'technology_ids': [],
      });
      expect(p.toJson(), {'category_id': null, 'technology_ids': []});
      expect(p.toJson().containsKey('title'), isFalse);
    });
    test('response fields and publication dates cannot be written', () {
      expect(() => WritePayload('EntryPatch', {'id': 1}), throwsArgumentError);
      expect(
        () => WritePayload('EntryPatch', {'published_at': '2026-01-01'}),
        throwsArgumentError,
      );
    });
    test('diff preserves unseen relationships', () {
      expect(
        patchDiff(
          {
            'title': 'Old',
            'technology_ids': [4],
          },
          {
            'title': 'New',
            'technology_ids': [4],
          },
        ),
        {'title': 'New'},
      );
    });
    test('duplicate relationships and nested field lengths are rejected', () {
      final errors = WritePayload('EntryPatch', {
        'technology_ids': [1, 1],
        'gallery': [
          {'media_id': 1, 'alt_text': 'x' * 501},
        ],
      }).validate();
      expect(
        errors.keys,
        containsAll(['technology_ids', 'gallery.0.alt_text']),
      );
    });
    test('full settings requires collapsed fields too', () {
      expect(
        WritePayload('SettingsCreate', {
          'site_title': 'Studio',
        }).validate().keys,
        containsAll([
          'contact_email',
          'social_links',
          'default_seo_description',
        ]),
      );
    });
    test('password byte limit counts UTF8', () {
      final errors = WritePayload('PasswordUpdate', {
        'current_password': 'old',
        'password': 'Aa1${'é' * 35}',
        'password_confirmation': 'Aa1${'é' * 35}',
      }).validate();
      expect(errors, contains('password'));
    });
    test('query-independent JSON booleans remain bools', () {
      expect(
        WritePayload('EntryPatch', {'featured': false}).toJson()['featured'],
        isFalse,
      );
    });
    test('safe links reject credentials and executable schemes', () {
      for (final u in [
        'javascript:alert(1)',
        'https://user:pass@example.test',
        'file:///etc/passwd',
        '//example.test',
      ]) {
        expect(safeWebUrl(u), isFalse);
      }
      expect(safeWebUrl('https://example.test'), isTrue);
    });
  });
  group('UTC inclusive ranges', () {
    test('default includes today and preceding 29 days', () {
      final r = UtcDateRange.recent(now: DateTime.utc(2024, 3, 1));
      expect(r.query, {'start_date': '2024-02-01', 'end_date': '2024-03-01'});
    });
    test('90 days allowed, 91 rejected', () {
      expect(
        UtcDateRange(
          DateTime.utc(2024, 1, 1),
          DateTime.utc(2024, 3, 30),
          now: DateTime.utc(2025),
        ),
        isNotNull,
      );
      expect(
        () => UtcDateRange(
          DateTime.utc(2024, 1, 1),
          DateTime.utc(2024, 3, 31),
          now: DateTime.utc(2025),
        ),
        throwsArgumentError,
      );
    });
    test('future and reversed ranges rejected', () {
      expect(
        () => UtcDateRange(
          DateTime.utc(2030),
          DateTime.utc(2030),
          now: DateTime.utc(2025),
        ),
        throwsArgumentError,
      );
      expect(
        () => UtcDateRange(
          DateTime.utc(2024, 2),
          DateTime.utc(2024, 1),
          now: DateTime.utc(2025),
        ),
        throwsArgumentError,
      );
    });
  });
  group('transport', () {
    late Adapter adapter;
    late PortfolioApi api;
    int expired = 0;
    void setup(Future<ResponseBody> Function(RequestOptions) fn) {
      adapter = Adapter(fn);
      final dio = Dio()..httpClientAdapter = adapter;
      api = PortfolioApi(
        'https://example.test/api/v1',
        credentials: () => 'secret-fixture',
        onUnauthorized: () => expired++,
        dio: dio,
      );
    }

    test('requires explicit API URL and HTTPS release', () {
      for (final u in [
        '',
        'https://example.test',
        'https://user@example.test/api/v1',
        'https://example.test/api/v1?x=1',
      ]) {
        expect(
          () => PortfolioApi(u, credentials: () => null),
          throwsArgumentError,
        );
      }
      expect(
        () => PortfolioApi(
          'http://example.test/api/v1',
          credentials: () => null,
          release: true,
        ),
        throwsArgumentError,
      );
    });
    test('bearer only on configured API and query bools use 0/1', () async {
      setup((o) async => jsonBody({'data': []}));
      await api.get('admin/entries', query: {'featured': false});
      expect(
        adapter.requests.single.uri.toString(),
        'https://example.test/api/v1/admin/entries?featured=0',
      );
      expect(
        adapter.requests.single.headers['Authorization'],
        'Bearer secret-fixture',
      );
      expect(adapter.requests.single.followRedirects, isFalse);
    });
    test('external absolute paths rejected before transport', () async {
      setup((o) async => jsonBody({}));
      for (final p in [
        'https://evil.test',
        '//evil.test',
        '/admin/entries',
        '../outside',
      ]) {
        await expectLater(api.get(p), throwsArgumentError);
      }
      expect(adapter.requests, isEmpty);
    });
    test('login never attaches stored bearer and 401 is not expiry', () async {
      setup(
        (o) async => jsonBody({'message': 'Invalid credentials'}, status: 401),
      );
      await expectLater(
        api.login('owner@example.test', 'bad'),
        throwsA(isA<ApiFailure>()),
      );
      expect(
        adapter.requests.single.headers.containsKey('Authorization'),
        isFalse,
      );
      expect(expired, 0);
    });
    test('204 accepts empty body', () async {
      setup((o) async => ResponseBody.fromString('', 204));
      await api.delete(Resource.entries, 1);
    });
    test('proxy HTML 413 becomes safe generic error', () async {
      setup(
        (o) async =>
            ResponseBody.fromString('<html>private proxy debug</html>', 413),
      );
      await expectLater(
        api.get('admin/media'),
        throwsA(
          isA<ApiFailure>().having(
            (e) => e.message,
            'message',
            'Image is too large.',
          ),
        ),
      );
    });
    test('dotted validation and request header fallback retained', () async {
      setup(
        (o) async => jsonBody(
          {
            'message': 'Invalid',
            'code': 'validation',
            'errors': {
              'gallery.0.alt_text': ['Required'],
            },
          },
          status: 422,
          headers: {
            'x-request-id': ['test-id'],
          },
        ),
      );
      await expectLater(
        api.get('admin/entries'),
        throwsA(
          isA<ApiFailure>()
              .having((e) => e.fields['gallery.0.alt_text'], 'field', [
                'Required',
              ])
              .having((e) => e.requestId, 'request', 'test-id'),
        ),
      );
    });
    test('429 honors server retry delay without automatic retries', () async {
      setup(
        (o) async => jsonBody(
          {},
          status: 429,
          headers: {
            'retry-after': ['13'],
          },
        ),
      );
      await expectLater(
        api.get('admin/entries'),
        throwsA(
          isA<ApiFailure>().having(
            (e) => e.retryAfter,
            'delay',
            const Duration(seconds: 13),
          ),
        ),
      );
      expect(adapter.requests.length, 1);
    });
    test('forbidden owner does not trigger invalid-token handling', () async {
      setup((o) async => jsonBody({}, status: 403));
      await expectLater(
        api.get('admin/entries'),
        throwsA(isA<ApiFailure>().having((e) => e.status, 'status', 403)),
      );
      expect(expired, 0);
    });
    test(
      'server failure during mutation is ambiguous and never retried',
      () async {
        setup((o) async => jsonBody({}, status: 500));
        await expectLater(
          api.request('PATCH', 'admin/entries/1', body: {'title': 'Test'}),
          throwsA(
            isA<ApiFailure>().having((e) => e.ambiguous, 'ambiguous', isTrue),
          ),
        );
        expect(adapter.requests.length, 1);
      },
    );
    test('Retry-After accepts a standard HTTP date', () async {
      setup(
        (o) async => jsonBody(
          {},
          status: 429,
          headers: {
            'retry-after': ['Wed, 21 Oct 2037 07:28:00 GMT'],
          },
        ),
      );
      await expectLater(
        api.get('admin/entries'),
        throwsA(
          isA<ApiFailure>().having(
            (e) => e.retryAfter!.inSeconds,
            'future retry',
            greaterThan(0),
          ),
        ),
      );
    });
    test('protected 401 expires once and blocks later calls', () async {
      setup((o) async => jsonBody({}, status: 401));
      await expectLater(api.get('admin/entries'), throwsA(isA<ApiFailure>()));
      await expectLater(api.get('admin/entries'), throwsA(isA<ApiFailure>()));
      expect(expired, 1);
      expect(adapter.requests.length, 1);
    });
    test('late responses cannot enter a new session', () async {
      final ready = Completer<void>();
      final body = Completer<ResponseBody>();
      setup((o) {
        ready.complete();
        return body.future;
      });
      final future = api.get('admin/entries');
      final assertion = expectLater(future, throwsA(isA<ApiFailure>()));
      await ready.future;
      api.newSession();
      body.complete(
        jsonBody({
          'data': [
            {'id': 1},
          ],
        }),
      );
      await assertion;
    });
    test('malformed successful JSON is parsing error', () async {
      setup((o) async => ResponseBody.fromString('broken', 200));
      await expectLater(
        api.get('admin/entries'),
        throwsA(isA<ApiFailure>().having((e) => e.code, 'code', 'parsing')),
      );
    });
  });
}
