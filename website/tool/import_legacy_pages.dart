// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:io';

import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as html_parser;

const pages = <String, String>{
  'home': 'index.html',
  'services': 'services.html',
  'projects': 'projects.html',
  'about': 'about.html',
  'contact': 'contact.html',
};

const routeReplacements = <String, String>{
  'index.html': '/',
  'services.html': '/services',
  'projects.html': '/projects',
  'about.html': '/about',
  'contact.html': '/contact',
};

String dartString(String value) => jsonEncode(value).replaceAll(r'$', r'\$');

String? emitNode(dom.Node node, int depth) {
  final indent = '  ' * depth;
  if (node is dom.Text) {
    final text = node.data.replaceAll(RegExp(r'\s+'), ' ');
    if (text.trim().isEmpty) return null;
    return '$indent Component.text(${dartString(text)}),\n';
  }
  if (node is! dom.Element || node.localName == 'script') return null;

  final attributes = <String, String>{};
  String? id;
  String? classes;
  for (final attribute in node.attributes.entries) {
    final name = attribute.key.toString();
    var value = attribute.value;
    if (name == 'onsubmit' || name.startsWith('on')) continue;
    if (name == 'href') value = routeReplacements[value] ?? value;
    if (name == 'id') {
      id = value;
    } else if (name == 'class') {
      classes = value;
    } else {
      attributes[name] = value;
    }
  }

  final output = StringBuffer()
    ..writeln('$indent// ignore: prefer_html_components')
    ..writeln('$indent Component.element(')
    ..writeln('$indent  tag: ${dartString(node.localName!)},');
  if (id != null) output.writeln('$indent  id: ${dartString(id)},');
  if (classes != null) {
    output.writeln('$indent  classes: ${dartString(classes)},');
  }
  if (attributes.isNotEmpty) {
    output.writeln('$indent  attributes: {');
    for (final attribute in attributes.entries) {
      output.writeln(
        '$indent    ${dartString(attribute.key)}: ${dartString(attribute.value)},',
      );
    }
    output.writeln('$indent  },');
  }

  final children = node.nodes.map((child) => emitNode(child, depth + 2)).whereType<String>().toList();
  if (children.isNotEmpty) {
    output.writeln('$indent  children: [');
    for (final child in children) {
      output.write(child);
    }
    output.writeln('$indent  ],');
  }
  output.writeln('$indent ),');
  return output.toString();
}

void main() {
  final source = Directory('../brothers_tech_website');
  if (!source.existsSync()) {
    stderr.writeln('Could not find ${source.path}.');
    exitCode = 1;
    return;
  }

  final output = StringBuffer()
    ..writeln('// Generated as native Jaspr components by tool/import_legacy_pages.dart.')
    ..writeln('// No raw HTML is rendered by this file.')
    ..writeln('// ignore_for_file: prefer_html_components')
    ..writeln()
    ..writeln("import 'package:jaspr/jaspr.dart';")
    ..writeln();

  for (final entry in pages.entries) {
    final html = File('${source.path}/${entry.value}').readAsStringSync();
    final document = html_parser.parse(html);
    final body = document.body;
    if (body == null) {
      stderr.writeln('Could not find <body> in ${entry.value}.');
      exitCode = 1;
      return;
    }

    output
      ..writeln('const ${entry.key}BodyClasses = ${dartString(body.className)};')
      ..writeln()
      ..writeln('Component build${entry.key[0].toUpperCase()}${entry.key.substring(1)}Page() {')
      ..writeln('  return Component.fragment([');
    for (final node in body.nodes) {
      final emitted = emitNode(node, 2);
      if (emitted != null) output.write(emitted);
    }
    output
      ..writeln('  ]);')
      ..writeln('}')
      ..writeln();
  }

  Directory('lib/components/generated').createSync(recursive: true);
  File('lib/components/generated/site_pages.g.dart').writeAsStringSync(output.toString());
  stdout.writeln('Converted ${pages.length} HTML pages into native Jaspr component trees.');
}
