# Dashboard development

Use Flutter 3.47.7 stable (Dart 3.13.5), JDK 17, an installed Android SDK and accepted licenses. Application identity is `com.mahmoudbannan.portfolio_admin`. The app targets Android only. Installed versions and actual results are in dashboard-completion.md. Both app and shared-package lockfiles are retained for reproducible application verification. The Dart-only package may be consumed independently; it contains no secure storage or UI dependencies.

From the repository root:

```sh
cd packages/portfolio_api
dart pub get --enforce-lockfile
dart analyze --fatal-infos
dart test
cd ../../dashboard
flutter pub get --enforce-lockfile
flutter analyze --fatal-infos
flutter test
flutter run --dart-define=API_BASE_URL=http://10.0.2.2:8000/api/v1
flutter build apk --debug --dart-define=API_BASE_URL=http://10.0.2.2:8000/api/v1
```

`API_BASE_URL` must end in `/api/v1`, contain no credentials/query/fragment and be explicitly configured. Missing/invalid configuration shows a startup error. Release requires HTTPS in Dart and disallows cleartext in the Android main manifest; the debug manifest alone permits local HTTP. TLS verification is never disabled. The emulator's `10.0.2.2` addresses the host; `localhost` addresses the emulator. Physical devices need the host LAN address and firewall permission. The backend `MEDIA_URL` must also be device-reachable; successful API login does not prove images work. Run `storage:link` for local media and run a separate database queue worker. See api-integration.md and development.md for the existing PostgreSQL/backend setup and owner creation/recovery commands. Never put owner passwords in source, command-line defines or shell history.

Transport uses 15-second connect and 30-second send/receive defaults, with 120 seconds for image transfer. No writes retry automatically. A timeout can mean a committed change: forms block resubmission until a server reload/review. Error responses retain request IDs and dotted field keys; no HTTP payload logging is installed. Pagination uses configured-origin page numbers, never returned absolute links. Search waits 350ms, cancels old requests and ignores stale completions; failed later pages preserve prior content. Successful mutations reload server data/list state.

Credentials use flutter_secure_storage's default Android Keystore encryption. Android backups are disabled, with explicit cloud/device-transfer exclusions for Android 12 and later. Startup validates `/admin/auth/me`; network failure has its own retry screen. A protected 401 cancels the session and prompts reauthentication, with no refresh endpoint. Nonsecret dirty form values live only in memory; password fields never enter the draft store. Overview offers review of same-account drafts after reauth. Explicit sign-out clears drafts and private navigation state. A failed server logout offers retry or clearly described local-only credential removal. Password change revokes all tokens.

Uploads use the system picker with JPEG/PNG/WebP filters and a 10 MiB client check; the server enforces decoding/dimension/pixel constraints. An app-owned temporary staging copy is removed after transfer/disposal. Transfer percentage means bytes sent. The image screen checks processing/deleting with 2/3/5-second intervals up to two minutes; background/disposal cancels polling. Ready-only selectors exclude failed, processing and deleting images. A terminal failure offers a new upload; there is no invented processing-retry endpoint. Public image requests carry no bearer.

Dependencies: Dio provides transport/progress/cancellation; Riverpod injects session/API dependencies; go_router supplies guarded indexed navigation; flutter_secure_storage persists only credentials/expiry/server binding; file_picker supplies system grants; flutter_markdown_plus renders Markdown without HTML execution; url_launcher handles validated external HTTP(S)/mailto links. Fonts and package license information are included in Flutter's license registry/build dependencies. Exact dependency versions are in pubspec.lock; no network font package is used.

Production endpoint and private signing preparation are documented in [dashboard-release-preparation.md](dashboard-release-preparation.md). The production example starts with an empty URL; release tasks reject HTTP/placeholder URLs, driver targets and missing private signing inputs. No production identity or signed artifact was created.

Real-backend client smoke (from packages/portfolio_api; values below are test placeholders):

```sh
DASHBOARD_CONFIRM_DISPOSABLE=1 \
DASHBOARD_SMOKE_BASE=http://127.0.0.1:18081/api/v1 \
DASHBOARD_SMOKE_EMAIL=fictional-owner@example.test \
DASHBOARD_SMOKE_SECRET_FILE=/secure/path/disposable-owner-password \
DASHBOARD_SMOKE_IMAGE=/tmp/fictional.png \
dart run tool/smoke.dart
```

The script refuses non-loopback APIs, creates only fictional test entities, restores settings and deletes only IDs it created. Use a new isolated PostgreSQL database and running worker. Do not point it at real content.

Android runtime smoke (from dashboard, same securely injected test email/password-file/image variables and confirmation):

```sh
flutter drive --driver=test_driver/smoke_test.dart --target=test_driver/app.dart \
  -d emulator-5554 --dart-define=API_BASE_URL=http://10.0.2.2:18081/api/v1
```

The separate debug test target enables FlutterDriver only for that process. It checks UI login, Android secure-storage bootstrap, real media processing/reachability, publication/public GET/unpublish and logout, and writes fictional screenshots under test/screenshots. Normal `lib/main.dart` has no driver extension. Native integration_test instrumentation was replaced because official Google Maven returned 404 for its AndroidX runner/rules/Espresso dependencies in this environment. The hosted dashboard workflow runs static/unit/widget checks and debug APK build; device execution is a separate explicit command, not a skipped passing job.
