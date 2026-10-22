import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart' show parseHttpDate;

import 'models.dart';
import 'payload.dart';

export 'package:dio/dio.dart'
    show CancelToken, Dio, HttpClientAdapter, ResponseBody, RequestOptions;

typedef Json = Map<String, dynamic>;

enum Resource {
  entries('entries', 'Entry'),
  categories('categories', 'Category'),
  technologies('technologies', 'Technology'),
  team('team-members', 'TeamMember'),
  services('services', 'Service'),
  media('media', ''),
  inquiries('inquiries', 'Inquiry'),
  audit('audit-events', '');

  const Resource(this.path, this.schema);
  final String path;
  final String schema;
  String get route => 'admin/$path';
}

class ApiFailure implements Exception {
  final String message;
  final String code;
  final int? status;
  final Map<String, List<String>> fields;
  final String? requestId;
  final Duration? retryAfter;
  final bool ambiguous;
  const ApiFailure(
    this.message, {
    this.code = 'network',
    this.status,
    this.fields = const {},
    this.requestId,
    this.retryAfter,
    this.ambiguous = false,
  });
  @override
  String toString() =>
      '$message${requestId == null ? '' : '\nRequest ID: $requestId'}';
}

class ApiPage {
  final List<Json> items;
  final PaginationMeta meta;
  ApiPage(this.items, this.meta);
  factory ApiPage.fromJson(Json json) => ApiPage(
    (json['data'] as List)
        .map((e) => Map<String, dynamic>.from(e as Map))
        .toList(),
    PaginationMeta.fromJson(Map<String, dynamic>.from(json['meta'] as Map)),
  );
}

/// Owns no credential persistence. A session change invalidates every pending result.
class PortfolioApi {
  final Dio _dio;
  final Uri base;
  final Duration uploadTimeout;
  final FutureOr<String?> Function() credentials;
  final void Function()? onUnauthorized;
  final void Function()? onMutation;
  final Set<CancelToken> _pending = {};
  int _generation = 0;
  bool _blocked = false;
  PortfolioApi(
    String baseUrl, {
    required this.credentials,
    this.onUnauthorized,
    this.onMutation,
    Dio? dio,
    bool release = false,
    Duration connectTimeout = const Duration(seconds: 15),
    Duration sendTimeout = const Duration(seconds: 30),
    Duration receiveTimeout = const Duration(seconds: 30),
    this.uploadTimeout = const Duration(seconds: 120),
  }) : base = _validate(baseUrl, release),
       _dio = dio ?? Dio() {
    _dio.options = BaseOptions(
      baseUrl: '${base.toString().replaceAll(RegExp(r'/+$'), '')}/',
      connectTimeout: connectTimeout,
      sendTimeout: sendTimeout,
      receiveTimeout: receiveTimeout,
      followRedirects: false,
      responseType: ResponseType.plain,
      validateStatus: (_) => true,
      headers: {'Accept': 'application/json'},
    );
  }
  static Uri _validate(String value, bool release) {
    final u = Uri.tryParse(value);
    if (u == null ||
        !safeWebUrl(value) ||
        u.hasQuery ||
        u.hasFragment ||
        u.path.replaceAll(RegExp(r'/+$'), '') != '/api/v1' ||
        (release && (u.scheme != 'https' || isPlaceholderHost(u.host)))) {
      throw ArgumentError(
        'Set API_BASE_URL to an ${release ? 'HTTPS' : 'HTTP(S)'} URL ending in /api/v1',
      );
    }
    return u;
  }

  void newSession() {
    cancelSession();
    _blocked = false;
  }

  void cancelSession() {
    _generation++;
    for (final c in _pending.toList()) {
      c.cancel('Session changed');
    }
    _pending.clear();
  }

  Future<Json> request(
    String method,
    String path, {
    Json? query,
    Object? body,
    CancelToken? cancel,
    bool protected = true,
    void Function(int, int)? progress,
    bool upload = false,
  }) async {
    if (path.startsWith('/') ||
        path.contains('..') ||
        Uri.parse(path).hasScheme ||
        path.contains('?') ||
        path.contains('#') ||
        path.contains('\\') ||
        base
                .resolve('${base.path.replaceAll(RegExp(r"/+$"), "")}/$path')
                .origin !=
            base.origin) {
      throw ArgumentError('Only API-relative paths are accepted');
    }
    if (protected && _blocked) {
      throw const ApiFailure(
        'Session expired. Sign in again.',
        status: 401,
        code: 'session_expired',
      );
    }
    final generation = _generation;
    final token = cancel ?? CancelToken();
    _pending.add(token);
    try {
      final credential = protected ? await credentials() : null;
      if (generation != _generation) {
        throw const ApiFailure('Session changed', code: 'cancelled');
      }
      final response = await _dio.request<String>(
        path,
        data: body,
        queryParameters: query?.map(
          (k, v) => MapEntry(k, v is bool ? (v ? '1' : '0') : v),
        ),
        cancelToken: token,
        onSendProgress: progress,
        options: Options(
          method: method,
          headers: {
            if (credential != null) 'Authorization': 'Bearer $credential',
          },
          sendTimeout: upload ? uploadTimeout : null,
          receiveTimeout: upload ? uploadTimeout : null,
        ),
      );
      if (generation != _generation) {
        throw const ApiFailure('Session changed', code: 'cancelled');
      }
      final status = response.statusCode ?? 0;
      dynamic data;
      try {
        data = response.data == null || response.data!.isEmpty
            ? <String, dynamic>{}
            : jsonDecode(response.data!);
      } catch (_) {
        if (status >= 200 && status < 300) {
          throw ApiFailure(
            'The server returned an unreadable response. Reload and review before repeating a change.',
            code: 'parsing',
            ambiguous: method != 'GET',
          );
        }
      }
      if (status >= 200 && status < 300) {
        if (data is! Map) {
          throw ApiFailure(
            'Unexpected response format',
            code: 'parsing',
            ambiguous: method != 'GET',
          );
        }
        if (protected && method != 'GET') onMutation?.call();
        return Map<String, dynamic>.from(data);
      }
      if (status == 401 && protected && !_blocked) {
        _blocked = true;
        cancelSession();
        onUnauthorized?.call();
      }
      final m = data is Map ? data : {};
      final fields = <String, List<String>>{};
      if (m['errors'] is Map) {
        for (final e in (m['errors'] as Map).entries) {
          if (e.value is List) {
            fields[e.key.toString()] = (e.value as List)
                .map((v) => v.toString())
                .toList();
          }
        }
      }
      final retry = response.headers.value('retry-after');
      int? seconds = int.tryParse(retry ?? '');
      if (seconds == null && retry != null) {
        try {
          seconds = parseHttpDate(retry)
              .difference(DateTime.now().toUtc())
              .inSeconds;
          if (seconds < 0) seconds = 0;
        } catch (_) {}
      }
      throw ApiFailure(
        m['message'] is String
            ? m['message'] as String
            : switch (status) {
                413 => 'Image is too large.',
                403 => 'Owner access is unavailable. Sign out or contact the server administrator.',
                409 => 'This item is still referenced or published. Detach references or unpublish before deleting.',
                429 => 'Too many requests. Wait before trying again.',
                _ =>
                  'The server could not complete this request (HTTP $status).',
              },
        status: status,
        ambiguous: method != 'GET' && status >= 500,
        code: m['code']?.toString() ?? 'http',
        fields: fields,
        requestId:
            m['request_id']?.toString() ??
            response.headers.value('x-request-id'),
        retryAfter: seconds == null ? null : Duration(seconds: seconds),
      );
    } on DioException catch (e) {
      if (CancelToken.isCancel(e)) {
        throw const ApiFailure('Request cancelled', code: 'cancelled');
      }
      throw ApiFailure(
        'Unable to reach the server. Check your connection.${method == 'GET' ? '' : ' The change may have been saved. Reload and review before trying again.'}',
        ambiguous: method != 'GET',
        code: 'network',
      );
    } finally {
      _pending.remove(token);
    }
  }

  Future<Json> get(String path, {Json? query, CancelToken? cancel}) =>
      request('GET', path, query: query, cancel: cancel);
  Future<ApiPage> list(Resource r, {Json? query, CancelToken? cancel}) async =>
      ApiPage.fromJson(await get(r.route, query: query, cancel: cancel));
  Future<Json> detail(Resource r, int id, {CancelToken? cancel}) async =>
      Map<String, dynamic>.from(
        (await get('${r.route}/$id', cancel: cancel))['data'] as Map,
      );
  Future<Json> save(Resource r, WritePayload payload, {int? id}) async =>
      Map<String, dynamic>.from(
        (await request(
              id == null ? 'POST' : 'PATCH',
              '${r.route}${id == null ? '' : '/$id'}',
              body: payload.toJson(),
            ))['data']
            as Map,
      );
  Future<void> delete(Resource r, int id) async {
    await request('DELETE', '${r.route}/$id');
  }

  Future<LoginResult> login(String email, String password) async =>
      LoginResult.fromJson(
        Map<String, dynamic>.from(
          (await request(
                'POST',
                'admin/auth/login',
                protected: false,
                body: {
                  'email': email,
                  'password': password,
                  'device_name': 'Bannan Admin Android',
                },
              ))['data']
              as Map,
        ),
      );
  Future<User> me() async => User.fromJson(
    Map<String, dynamic>.from((await get('admin/auth/me'))['data'] as Map),
  );
  Future<void> logout({bool all = false}) async {
    await request('POST', 'admin/auth/${all ? 'logout-all' : 'logout'}');
  }

  Future<void> password(WritePayload payload) async {
    await request('PUT', 'admin/auth/password', body: payload.toJson());
  }

  Future<Json> settings() async => Map<String, dynamic>.from(
    (await get('admin/site-settings'))['data'] as Map,
  );
  Future<Json> putSettings(WritePayload payload) async =>
      Map<String, dynamic>.from(
        (await request(
              'PUT',
              'admin/site-settings',
              body: payload.toJson(),
            ))['data']
            as Map,
      );
  Future<AdminMedia> upload(
    String path,
    String filename, {
    CancelToken? cancel,
    void Function(int, int)? progress,
  }) async => AdminMedia.fromJson(
    Map<String, dynamic>.from(
      (await request(
            'POST',
            'admin/media',
            upload: true,
            cancel: cancel,
            progress: progress,
            body: FormData.fromMap({
              'file': await MultipartFile.fromFile(path, filename: filename),
            }),
          ))['data']
          as Map,
    ),
  );
}

/// Reserved documentation hosts must never produce an apparently configured release.
bool isPlaceholderHost(String host) {
  final h = host.toLowerCase();
  return h == 'localhost' ||
      h == '127.0.0.1' ||
      h == '::1' ||
      h == 'your-api-host' ||
      h.endsWith('.test') ||
      h.endsWith('.invalid') ||
      h.endsWith('.localhost') ||
      RegExp(r'(^|\.)example\.(com|org|net)$').hasMatch(h);
}
