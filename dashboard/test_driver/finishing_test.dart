import 'dart:convert';
import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

Future<String> adb(List<String> args) async {
  final result = await Process.run('adb', ['-s', 'emulator-5554', ...args]);
  if (result.exitCode != 0) {
    throw StateError('adb ${args.take(2).join(' ')} failed');
  }
  return result.stdout as String;
}

Future<void> nativeTap(String text) async {
  for (var attempt = 0; attempt < 12; attempt++) {
    await adb(['shell', 'uiautomator', 'dump', '/sdcard/finishing-window.xml']);
    final xml = await adb(['shell', 'cat', '/sdcard/finishing-window.xml']);
    for (final node in RegExp(r'<node\b[^>]+>').allMatches(xml)) {
      final attrs = {
        for (final m in RegExp(
          r'([\w-]+)="([^"]*)"',
        ).allMatches(node.group(0)!))
          m.group(1)!: m.group(2)!,
      };
      if (attrs['text'] == text ||
          attrs['content-desc'] == text ||
          (attrs['content-desc'] ?? '').startsWith('$text,')) {
        final b = RegExp(r'\d+')
            .allMatches(attrs['bounds'] ?? '')
            .map((m) => int.parse(m.group(0)!))
            .toList();
        if (b.length == 4) {
          await adb([
            'shell',
            'input',
            'tap',
            '${(b[0] + b[2]) ~/ 2}',
            '${(b[1] + b[3]) ~/ 2}',
          ]);
          return;
        }
      }
    }
    await Future<void>.delayed(const Duration(milliseconds: 300));
  }
  throw StateError('Native control not found: $text');
}

void main() {
  late FlutterDriver driver;
  final evidence = Directory('../docs/dashboard-evidence/native')
    ..createSync(recursive: true);
  Future<void> shot(String name) async {
    stderr.writeln("Evidence: $name");
    await File('${evidence.path}/$name.png')
        .writeAsBytes(await driver.screenshot());
  }

  Future<void> signIn() async {
    await driver.waitFor(find.text('Sign in'));
    await driver.tap(find.byValueKey('login-email'));
    await driver.enterText(Platform.environment['DASHBOARD_SMOKE_EMAIL']!);
    await driver.tap(find.byValueKey('login-password'));
    await driver.enterText(
      File(Platform.environment['DASHBOARD_SMOKE_SECRET_FILE']!)
          .readAsStringSync()
          .trim(),
    );
    await driver.scrollIntoView(find.text('Sign in'));
    await driver.tap(find.text('Sign in'));
    await driver.waitFor(find.text('Studio overview'));
  }

  setUpAll(() async {
    if (Platform.environment['DASHBOARD_CONFIRM_DISPOSABLE'] != '1') {
      throw StateError('Explicit disposable confirmation required');
    }
    driver = await FlutterDriver.connect();
  });
  tearDownAll(() async {
    await driver.close();
  });
  test('finishing native QA: real picker, processing/background, visual states and expiry', () async {
    await driver.requestData(jsonEncode({'action': 'reset'}));
    await shot('01-login');
    await signIn();
    await File('${evidence.path}/metrics.json').writeAsString(
      await driver.requestData(jsonEncode({'action': 'metrics'})),
    );
    await driver.tap(find.text('Content'));
    await shot('17-empty-content');
    await driver.tap(find.text('Overview'));
    expect(
      await driver.requestData(
        jsonEncode({
          'action': 'prepare-visuals',
          'image': base64Encode(
            File(Platform.environment['DASHBOARD_SMOKE_IMAGE']!)
                .readAsBytesSync(),
          ),
        }),
        timeout: const Duration(minutes: 3),
      ),
      'prepared',
    );
    await shot('02-overview');
    await driver.tap(find.text('Content'));
    await shot('03-content');
    await driver.tap(find.text('Products'));
    await shot('content-filtered-empty');
    await driver.tap(find.text('Products'));
    await driver.waitFor(find.text('Field notes'));
    await driver.tap(find.text('Field notes'));
    await shot('04-entry-editor');
    for (var i = 0; i < 6; i++) {
      await adb([
        'shell',
        'input',
        'swipe',
        '530',
        '1800',
        '530',
        '350',
        '300',
      ]);
    }
    await nativeTap('Review and publish');
    await shot('05-publish-review');
    await driver.tap(find.text('Keep as draft'));
    await nativeTap('Back');
    await driver.waitFor(find.text('Your content'));
    await driver.tap(find.text('More'));
    await shot('12-more');
    await driver.tap(find.text('Media library'));
    await shot('06-ready-media');
    await driver.tap(find.text('Upload image'));
    await shot('20-upload-idle');
    await driver.tap(find.text('Choose image'));
    await adb(['shell', 'uiautomator', 'dump', '/sdcard/finishing-window.xml']);
    await File('${evidence.path}/picker-cancel.xml').writeAsString(
      await adb(['shell', 'cat', '/sdcard/finishing-window.xml']),
    );
    await adb(['shell', 'input', 'keyevent', '4']);
    await driver.waitFor(find.text('Choose image'));
    await shot('picker-cancel-return');
    final worker = Platform.environment['DASHBOARD_QA_WORKER_PID']!;
    await Process.run('kill', ['-STOP', worker]);
    try {
      await driver.runUnsynchronized(() async {
        stderr.writeln('Opening actual picker');
        await driver.tap(find.text('Choose image'));
        // Select through the external-storage provider, not a recent/download index.
        await nativeTap('Show roots');
        await nativeTap('sdk_gphone_x86_64');
        await nativeTap('Download');
        await nativeTap('finishing-picker.png');
        stderr.writeln('Native file tap completed');
        await driver.waitFor(
          find.text('Status: Processing'),
          timeout: const Duration(seconds: 30),
        );
        await shot('20-upload-processing');
        await adb(['shell', 'input', 'keyevent', 'KEYCODE_HOME']);
        await Future<void>.delayed(const Duration(seconds: 3));
        await adb([
          'shell',
          'am',
          'start',
          '-n',
          'com.mahmoudbannan.portfolio_admin/.MainActivity',
        ]);
        await driver.waitFor(find.text('Image details'));
        await shot('picker-background-return');
      });
    } finally {
      await Process.run('kill', ['-CONT', worker]);
    }
    await driver.waitFor(
      find.text('Status: Ready'),
      timeout: const Duration(seconds: 45),
    );
    await shot('20-upload-ready');
    expect(
      await driver.requestData(jsonEncode({'action': 'record-picker-media'})),
      'picker ready exactly once',
    );
    await nativeTap('Back');
    await nativeTap('Back');
    await driver.requestData(jsonEncode({'action': 'expire'}));
    await driver.waitFor(find.text('Sign in'));
    await shot('19-expired');
    await signIn();
    await adb(['reverse', '--remove', 'tcp:18082']);
    try {
      await driver.tap(find.byTooltip('Refresh overview'));
      await driver.waitFor(
        find.text('Unable to reach the server. Check your connection.'),
      );
      await shot('18-connection-error');
    } finally {
      await adb(['reverse', 'tcp:18082', 'tcp:18082']);
    }
    await driver.tap(find.byTooltip('Refresh overview'));
    await driver.waitFor(find.text('Your work is getting seen'));
    await adb(['shell', 'settings', 'put', 'system', 'font_scale', '2.0']);
    await shot('overview-large-text');
    await driver.tap(find.text('More'));
    await shot('more-large-text');
    await adb(['shell', 'settings', 'put', 'system', 'font_scale', '1.0']);
    expect(
      jsonDecode(await driver.requestData(jsonEncode({'action': 'ui-errors'}))),
      isEmpty,
    );
    expect(
      await driver.requestData(jsonEncode({'action': 'cleanup-visuals'})),
      'cleaned',
    );
    // Leave the valid test-only credential for a separate normal-app process-restart check.
  }, timeout: const Timeout(Duration(minutes: 8)));
}
