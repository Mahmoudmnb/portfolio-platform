import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';
import 'app/theme.dart';
import 'core/session.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LicenseRegistry.addLicense(() async* {
    for (final name in ['Manrope', 'Roboto']) {
      yield LicenseEntryWithLineBreaks([
        name,
      ], await rootBundle.loadString('assets/fonts/$name-OFL.txt'));
    }
  });
  try {
    const url = String.fromEnvironment('API_BASE_URL');
    final session = OwnerSession(url, release: kReleaseMode);
    runApp(
      ProviderScope(
        overrides: [sessionProvider.overrideWithValue(session)],
        child: DashboardApp(session: session),
      ),
    );
    session.bootstrap();
  } catch (_) {
    runApp(
      MaterialApp(
        theme: brandTheme(),
        home: const Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: SelectableText(
                'Dashboard configuration is missing or invalid. Build with --dart-define=API_BASE_URL=https://your-api-host/api/v1. Release builds require HTTPS.',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
