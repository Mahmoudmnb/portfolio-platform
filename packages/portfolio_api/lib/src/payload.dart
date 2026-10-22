import 'dart:convert';

import 'contract.dart';

/// An absent map key is unset, a present null clears, and [] replaces with empty.
class WritePayload {
  final String schema;
  final Map<String, dynamic> _fields;
  WritePayload(this.schema, Map<String, dynamic> fields)
    : _fields = Map.of(fields) {
    final allowed = (writeSchemas[schema]!['properties'] as Map).keys.toSet();
    if (fields.keys.any((k) => !allowed.contains(k))) {
      throw ArgumentError('Read-only or unknown write field');
    }
    if (fields.containsKey('published_at')) {
      throw ArgumentError('Publication time belongs to the server');
    }
  }
  Map<String, dynamic> toJson() => Map.of(_fields);
  Map<String, String> validate() {
    final spec = writeSchemas[schema]!;
    final errors = <String, String>{};
    for (final key in spec['required'] as List) {
      if (!_fields.containsKey(key)) errors[key as String] = 'Required';
    }
    for (final e in _fields.entries) {
      _validate(
        e.value,
        (spec['properties'] as Map)[e.key] as Map,
        e.key,
        errors,
      );
    }
    if (schema == 'PasswordUpdate') {
      final value = _fields['password'] as String? ?? '';
      if (value.length < 12 ||
          utf8.encode(value).length > 72 ||
          !RegExp('[A-Z]').hasMatch(value) ||
          !RegExp('[a-z]').hasMatch(value) ||
          !RegExp('[0-9]').hasMatch(value)) {
        errors['password'] = 'Use 12+ characters, upper/lower case and a number; at most 72 UTF-8 bytes';
      }
      if (_fields['password_confirmation'] != value) {
        errors['password_confirmation'] = 'Passwords must match';
      }
    }
    return errors;
  }

  static void _validate(
    dynamic v,
    Map s,
    String key,
    Map<String, String> errors,
  ) {
    if (s.containsKey(r'$ref')) {
      // The only writable referenced schema is Link.
      s = {
        'type': 'object',
        'properties': {
          'label': {'type': 'string', 'maxLength': 80},
          'url': {'type': 'string', 'maxLength': 2048, 'format': 'uri'},
          'sort_order': {
            'type': 'integer',
            'minimum': -1000000,
            'maximum': 1000000,
          },
        },
        'required': ['label', 'url'],
      };
    }
    final type = s['type'];
    if (v == null) {
      if (!(type is List && type.contains('null'))) {
        errors[key] = 'Cannot be empty';
      }
      return;
    }
    final primaryType = type is List ? type.first : type;
    if ((primaryType == 'integer' && v is! int) ||
        (primaryType == 'boolean' && v is! bool) ||
        (primaryType == 'string' && v is! String) ||
        (primaryType == 'array' && v is! List)) {
      errors[key] = 'Enter a valid $primaryType';
      return;
    }
    if (v is String) {
      if (v.trim().isEmpty && !(type is List && type.contains('null'))) {
        errors[key] = 'Required';
      }
      if (s['maxLength'] is int && v.runes.length > (s['maxLength'] as int)) {
        errors[key] = 'Maximum ${s['maxLength']} characters';
      }
      if (s['pattern'] is String &&
          !RegExp(s['pattern'] as String).hasMatch(v)) {
        errors[key] = 'Invalid format';
      }
      if (s['format'] == 'uri' && !safeWebUrl(v)) {
        errors[key] = 'Use HTTP(S) without credentials';
      }
      if (s['format'] == 'email' &&
          !RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$').hasMatch(v)) {
        errors[key] = 'Enter a valid email';
      }
    }
    if (s['enum'] is List && !(s['enum'] as List).contains(v)) {
      errors[key] = 'Choose an allowed value';
    }
    if (v is num &&
        ((s['minimum'] is num && v < s['minimum']) ||
            (s['maximum'] is num && v > s['maximum']))) {
      errors[key] = 'Outside allowed range';
    }
    if (v is List) {
      if (s['maxItems'] is int && v.length > s['maxItems']) {
        errors[key] = 'Maximum ${s['maxItems']} items';
      }
      if (s['uniqueItems'] == true && v.toSet().length != v.length) {
        errors[key] = 'Remove duplicates';
      }
      if (key == 'gallery' &&
          v.map((e) => e['media_id']).toSet().length != v.length) {
        errors[key] = 'Choose each image once';
      }
      for (var i = 0; i < v.length; i++) {
        _validate(v[i], s['items'] as Map, '$key.$i', errors);
      }
    }
    if (v is Map && s['properties'] is Map) {
      for (final k in (s['required'] as List? ?? [])) {
        if (!v.containsKey(k)) errors['$key.$k'] = 'Required';
      }
      for (final e in v.entries) {
        final child = (s['properties'] as Map)[e.key];
        if (child is Map) _validate(e.value, child, '$key.${e.key}', errors);
      }
    }
  }
}

bool safeWebUrl(String value) {
  final uri = Uri.tryParse(value);
  return uri != null &&
      ['https', 'http'].contains(uri.scheme) &&
      uri.host.isNotEmpty &&
      uri.userInfo.isEmpty;
}

Map<String, dynamic> patchDiff(
  Map<String, dynamic> before,
  Map<String, dynamic> after,
) => {
  for (final e in after.entries)
    if (!before.containsKey(e.key) ||
        jsonEncode(before[e.key]) != jsonEncode(e.value))
      e.key: e.value,
};
