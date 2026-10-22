import 'dart:convert';
import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  late FlutterDriver driver;
  setUpAll(() async {
    if (Platform.environment['DASHBOARD_CONFIRM_DISPOSABLE'] != '1') {
      throw StateError('Disposable test environment required');
    }
    driver = await FlutterDriver.connect();
  });
  tearDownAll(() async {
    await driver.close();
  });
  test('Android login, encrypted-storage bootstrap, real media and publication, logout', () async {
    await driver.requestData(jsonEncode({'action': 'reset'}));
    await driver.waitFor(find.text('Sign in'));
    await driver.tap(find.byValueKey('login-email'));
    await driver.enterText(Platform.environment['DASHBOARD_SMOKE_EMAIL']!);
    await driver.tap(find.byValueKey('login-password'));
    await driver.enterText(
      File(Platform.environment['DASHBOARD_SMOKE_SECRET_FILE']!)
          .readAsStringSync()
          .trim(),
    );
    await driver.tap(find.text('Sign in'));
    await driver.waitFor(find.text('Studio overview'));
    expect(
      await driver.requestData(jsonEncode({'action': 'validate-storage'})),
      'validated',
    );
    final dir = Directory('test/screenshots')..createSync(recursive: true);
    await File('${dir.path}/android-overview.png')
        .writeAsBytes(await driver.screenshot());
    for (final destination in ['Content', 'Inbox', 'More']) {
      await driver.tap(find.text(destination));
      await File('${dir.path}/android-${destination.toLowerCase()}.png')
          .writeAsBytes(await driver.screenshot());
    }
    for (final destination in [
      'Team',
      'Services',
      'Media library',
      'Analytics',
      'Site settings',
    ]) {
      await driver.tap(find.text(destination));
      await File(
        '${dir.path}/android-${destination.toLowerCase().replaceAll(' ', '-')}.png',
      ).writeAsBytes(await driver.screenshot());
      await driver.tap(find.byType('BackButton'));
    }

    expect(
      await driver.requestData(
        jsonEncode({
          'action': 'slice',
          'image': base64Encode(
            File(Platform.environment['DASHBOARD_SMOKE_IMAGE']!)
                .readAsBytesSync(),
          ),
        }),
        timeout: const Duration(minutes: 3),
      ),
      'slice passed',
    );
    expect(
      await driver.requestData(jsonEncode({'action': 'logout'})),
      'signed out',
    );
    await driver.waitFor(find.text('Sign in'));
    await File('${dir.path}/android-login.png')
        .writeAsBytes(await driver.screenshot());
  }, timeout: const Timeout(Duration(minutes: 5)));
}
