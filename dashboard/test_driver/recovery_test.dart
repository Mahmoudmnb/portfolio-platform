import 'dart:convert';
import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'finishing_test.dart' show adb, nativeTap;

void main() {
  late FlutterDriver driver;
  final evidence = Directory('../docs/dashboard-evidence/native');
  Future<void> shot(String name) async {
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
      throw StateError('Disposable confirmation required');
    }
    driver = await FlutterDriver.connect();
  });
  tearDownAll(() async {
    await adb(['reverse', 'tcp:18082', 'tcp:18082']);
    await adb(['shell', 'settings', 'put', 'system', 'font_scale', '1.0']);
    await driver.close();
  });
  test('native network recovery, expiry and accessible large text', () async {
    await driver.requestData(jsonEncode({'action': 'reset'}));
    await signIn();
    await adb(['reverse', '--remove', 'tcp:18082']);
    try {
      await driver.tap(find.byTooltip('Refresh overview'));
      await driver.waitFor(
        find.text('Unable to reach the server. Check your connection.'),
        timeout: const Duration(seconds: 45),
      );
      await shot('18-connection-error');
    } finally {
      await adb(['reverse', 'tcp:18082', 'tcp:18082']);
    }
    await driver.tap(find.byTooltip('Refresh overview'));
    await driver.waitFor(find.text('Your work is getting seen'));
    await driver.requestData(jsonEncode({'action': 'expire'}));
    await driver.waitFor(find.text('Sign in'));
    await shot('19-expired');
    await signIn();
    await adb(['shell', 'settings', 'put', 'system', 'font_scale', '2.0']);
    await shot('overview-large-text');
    await driver.tap(find.text('More'));
    await shot('more-large-text');
    await adb(['shell', 'settings', 'put', 'system', 'font_scale', '1.0']);
    await driver.tap(find.text('Team'));
    await shot('07-team');
    await nativeTap('Back');
    await driver.tap(find.text('Services'));
    await shot('14-services');
    await nativeTap('Back');
    await driver.tap(find.text('Categories & technologies'));
    await shot('15-taxonomies');
    await nativeTap('Back');
    expect(
      jsonDecode(await driver.requestData(jsonEncode({'action': 'ui-errors'}))),
      isEmpty,
    );
    expect(
      await driver.requestData(jsonEncode({'action': 'validate-storage'})),
      'validated',
    );
  }, timeout: const Timeout(Duration(minutes: 3)));
}
