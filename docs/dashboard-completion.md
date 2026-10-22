> Production-connected Android preparation, 2026-10-22: see [current review build and results](dashboard-production-review.md). Disposable-backend artifacts and earlier test counts below are historical.

# Dashboard finishing results — 2026-10-21

Completed available source fixes and regression checks from dashboard-finishing-plan.md. This is a development verification report, not release/distribution approval. The original implementation evidence is retained below as history.

Changes: actual Figma login/overview/content/empty/publish-review hierarchy, borderless cards, typography/status badges, primary actions and exact local SVG navigation; native form field coverage retained. Fixed an already-mounted Content list remaining empty after another screen created an entry. Fixed missing semantic activation on the new custom navigation. Production examples now start with an empty URL; runtime and Gradle reject documentation hosts/HTTP, release tasks reject driver targets, and private signing uses ignored properties/environment inputs with no debug certificate fallback. No production identity was created.

| Fresh finishing check | Observed result |
| --- | --- |
| packages/portfolio_api locked pub resolution, fatal-info analysis, dart test | passed; **30 tests** |
| dashboard locked pub resolution, fatal-info analysis, flutter test | passed; **36 tests**; [test log](dashboard-evidence/logs/widget-tests.log) |
| Changed app/client/driver source formatting | passed; 31 files, zero changes |
| Regenerate models/contract metadata + format + SHA-256 comparison | passed; both generated files byte-identical |
| Fresh PostgreSQL/queue API smoke | passed; image processing/public thumbnail URL, CRUD/relations, publish/public GET/unpublish, settings restoration, inquiry notes, five reports/audit, exact-ID cleanup and logout revocation; [log](dashboard-evidence/logs/api-smoke.log) |
| Figma comparisons | **7 passed with documented adaptations; 13 blocked by Starter-plan MCP call limit**; [all 20 rows](dashboard-visual-review.md) |
| Native Android finishing execution | **partial**: independent recovery suite passed (1 test, 28s); actual picker cancellation passed, but selection failed/unresolved in the driver suite and did not return to image details in the ordinary APK. Processing/background steps were not reached. [Actual matrix](dashboard-manual-qa.md) and failed logs retained. |
| Ordinary APK rotation and process restart | passed; [lifecycle evidence](dashboard-evidence/native/normal-lifecycle.json); retained credentials validate after initialization |
| ARM64 normal build | **blocked**; official 180,591,679-byte engine download did not complete within bounded retries/deadline; actual ordinary ARM64 build timed out after 120 seconds, exit 124; no verified ARM64 APK |
| Physical ARM64 device | **blocked**; no physical device attached; emulator execution is separate |
| Hosted GitHub Actions | **blocked**; no Git HEAD, zero tracked files, no intended committed revision; gh absent. No run URL/SHA/result. [Exact UI/CLI handoff](dashboard-hosted-ci.md) |
| Release preflight | passed: six expected negative cases reject missing URL, HTTP, two placeholder hosts, driver target and missing private signing; [results](dashboard-evidence/release-preflight.json) |
| Signed release/certificate/live HTTPS infrastructure | **not run**; legitimate endpoint/signing inputs absent. [Preparation guide](dashboard-release-preparation.md) |
| Backend/website/OpenAPI/backend workflow preservation | **141 files match fresh SHA-256 baseline**; no backend or website changes |

Ordinary review APK: [bannan-studio-finishing-debug-x86_64.apk](../dashboard/build/review/bannan-studio-finishing-debug-x86_64.apk), **86,758,235 bytes**, SHA-256 **d6632a9f5412ee00f19ce3a36418752314e1cf334ff1639bf2f0c7e371484380**. App ID `com.mahmoudbannan.portfolio_admin`, version 1.0.0, split APK versionCode 4001, debug, ordinary lib/main.dart, x86-64 only (libflutter.so + libdartjni.so). Built with `flutter build apk --debug --split-per-abi --target-platform android-x64 --dart-define=API_BASE_URL=http://127.0.0.1:18082/api/v1`. Compiled kernel has no `ext.flutter.driver` or generated owner password. [Artifact inspection](dashboard-evidence/review-artifact.json), [manifest](dashboard-evidence/logs/review-manifest.txt). Debug manifest explicitly permits local HTTP; main/release manifest disables cleartext and backups and excludes cloud/device-transfer data. TLS validation remains intact. No signed release manifest/certificate inspection is implied.

This APK requires a running development API, fresh disposable owner and `adb reverse tcp:18082 tcp:18082`; returned media URLs must use that same device-reachable origin. The task's private fixture owner is disabled and its API/worker stopped at cleanup. Changing the compile-time URL requires rebuilding. This APK is neither an ARM phone artifact nor a hosted demo. ARM download provenance/checksum expectations are [recorded](dashboard-evidence/arm64-official-source.json); partial bytes were never accepted as a verified engine.

The finishing environment uses a separate `/tmp/dashboard-finishing-backend` copy, a new `dashboard_finishing_20261021_testing` PostgreSQL database, generated fictional owner credentials in a private temporary file and a separate queue worker. Backend .env was not read. Only explicitly created fixture IDs were removed; the guarded smoke restored singleton settings. Existing PostgreSQL and the emulator that predated this finishing task are preserved. No commit, push, deployment, public upload, store publication, credential rotation or production migration occurred.

Toolchain remains Flutter 3.47.7 / Dart 3.13.5, JDK 17.0.20.1, compile/target 36/min 24, Gradle 9.3.1/AGP 9.0.1/Kotlin 2.3.20/NDK 28.2.13676358. Added flutter_svg 2.3.0 with locked transitive dependencies to render actual local design vectors. New screenshots and metrics are under dashboard-evidence/native. See [native/human matrix](dashboard-manual-qa.md), [finishing status](dashboard-finishing-progress.md), [design comparison](dashboard-visual-review.md), [CI](dashboard-hosted-ci.md) and [release preparation](dashboard-release-preparation.md).

Human TalkBack, complete long-form/keyboard review, physical navigation gestures, email-client handoff and picker activity destruction/lost-result behavior remain unexecuted. Automated semantics does not close those gates.

---

# Initial implementation evidence (historical)

Implemented on 2026-10-21 (Asia/Damascus). The Flutter Android dashboard, Dart-only client, dashboard CI and handoff documentation are present. Backend, Jaspr website and OpenAPI remain unchanged. Implementation spans phases 0–7; external visual, manual accessibility and distribution gates remain explicitly open below.

The app uses live API repositories for owner authentication, entry/project/product management, media upload and processing, team, services, categories/technologies, full site settings, inquiries, overview, five analytics reports and audit history. No illustrative repositories, production credentials, visitor-event ingestion, invented endpoints or public deployment were added. All writable content fields have an explicit form control or visibility action; a contract-to-form test checks coverage. Responses and write payloads are separate, with nested relations mapped to IDs and PATCH omission/null/empty semantics preserved.

Initial locally observed results (superseded by finishing results above where applicable):

| Command / check | Result |
| --- | --- |
| `dart pub get --enforce-lockfile` in packages/portfolio_api | Passed, final lockfile unchanged |
| `dart analyze --fatal-infos` in packages/portfolio_api | Passed, no issues |
| `dart test` in packages/portfolio_api | Passed: 30 tests |
| `flutter pub get --enforce-lockfile` in dashboard | Passed, final lockfile unchanged |
| `flutter analyze --fatal-infos` in dashboard | Passed, no issues |
| `flutter test` in dashboard | Passed: 32 tests |
| `dart format --output=none --set-exit-if-changed` over app/client sources and tests | Passed: 28 files, zero changes |
| Regenerate contract models/metadata, format, compare SHA-256 | Passed, generated files reproduce exactly |
| Guarded `dart run tool/smoke.dart` against disposable PostgreSQL and queue | Passed; real image processing/thumbnail URL, CRUD, relations, settings, inquiries, all reports, audit and cleanup |
| `flutter build apk --debug --target-platform android-x64 --dart-define=API_BASE_URL=http://10.0.2.2:18081/api/v1` | Passed; normal lib/main.dart target |
| `flutter drive --driver=test_driver/smoke_test.dart --target=test_driver/app.dart -d emulator-5554 --dart-define=API_BASE_URL=http://10.0.2.2:18081/api/v1` with securely injected disposable test variables | Passed; actual Android execution, not a skipped test |
| Normal APK installation / startup | Passed on API 30 x86-64 emulator |
| Normal APK architecture / test-extension inspection | x86-64 only; `ext.flutter.driver` absent from normal compiled kernel |
| Dashboard workflow YAML | Parsed; read-only repository permissions and scoped paths |
| Preservation baseline | 140 backend/website/contract files match recorded SHA-256 hashes (dependency/runtime storage directories excluded) |
| Generated test password source scan | No occurrence in dashboard/client source |

Test coverage includes supplied integration fixtures, nullable/nested parsing, optional link ordering, request field whitelists, relation replacement/diffs, numeric validation, password UTF-8 limits, safe links, leap-day/inclusive UTC ranges, token host/redirect protection, login/protected 401 distinctions, 403, 204, non-JSON 413, dotted 422 keys/request IDs, numeric and HTTP-date Retry-After, ambiguous server write failures, late-response isolation and mutation invalidation. Dashboard tests cover storage failure, offline/expired/forbidden startup, login/logout/password state, in-memory draft cleanup, stale search/page completion, deduplication/later-page retry, successful form save/navigation, dirty back confirmation, required-field announcements, rate-limit countdown and media background/disposal cancellation. Responsive tests use 360/412/840 logical widths at 1×/2× text, including wrapped persistent navigation.

The host smoke uses the actual shared client and PostgreSQL 18.6 in a new `dashboard_20261021_testing` database. A separate worker processes actual PNG input into WebP. It creates fictional entries/team/services/taxonomies, verifies published public GET and unpublish 404, confirms used-media 409, checks null/empty/omitted relationships and stable slugs, preserves all required settings during PUT, confirms inquiry GET does not mark read, saves a private note, reads five analytics reports and audit, restores settings and deletes only created entity IDs. Logout revocation is checked. Historical backend PHPUnit numbers were not reused as dashboard evidence.

The Android driver signs in through the actual login form, reboots the session controller using Android secure storage and `/admin/auth/me`, fetches actual media URLs through the emulator, runs upload → ready → create draft → publish → public GET → unpublish → public 404, cleans up and signs out. The picker itself is not automated: the test supplies a fictional image to the same API upload flow. Native instrumentation dependencies returned 404 from Google Maven; a separate debug-only FlutterDriver target avoids altering normal application code or shipping an enabled test extension.

Reviewable normal debug APK: [bannan-studio-debug-x86_64.apk](../dashboard/build/review/bannan-studio-debug-x86_64.apk). It targets the disposable emulator API on port 18081 and contains no credentials. This is an x86-64 debug artifact, not a signed production or ARM-device release. Rebuild with the appropriate API URL for your environment.

Fictional native screenshots: [overview](../dashboard/test/screenshots/android-overview.png), [login](../dashboard/test/screenshots/android-login.png), [content](../dashboard/test/screenshots/android-content.png), [inbox](../dashboard/test/screenshots/android-inbox.png), [More](../dashboard/test/screenshots/android-more.png), [team](../dashboard/test/screenshots/android-team.png), [services](../dashboard/test/screenshots/android-services.png), [media](../dashboard/test/screenshots/android-media-library.png), [analytics](../dashboard/test/screenshots/android-analytics.png), [settings](../dashboard/test/screenshots/android-site-settings.png). Main-screen native renders were inspected against the plan's fallback tokens. Figma context/screenshot retrieval was unavailable; no exact visual comparison is claimed. Screenshots use only seeded/disposable fictional data, and login captures have empty credentials.

Normal review artifact: 121,093,949 bytes; SHA-256 `df71a209c6b8c68d04dbcce837d19a5f2ec3a179343644f422563ae90df08f5a`. The separately preserved review APK was built from lib/main.dart and inspected for absence of the driver extension.

Versions exercised:

| Component | Version |
| --- | --- |
| Flutter / Dart | 3.47.7 stable / 3.13.5 |
| JDK | OpenJDK 17.0.20.1 |
| Android compile / target / minimum | 36 / 36 / 24 |
| Android build tools / NDK | 36.0.0 / 28.2.13676358 |
| Gradle / Android Gradle plugin / Kotlin | 9.3.1 / 9.0.1 / 2.3.20 |
| Emulator / exercised Android | 36.2.12.0 / API 30 x86-64, Pixel 7 AVD |
| Dio / http_parser | 5.11.1 / 4.1.2 |
| flutter_riverpod / go_router | 3.4.3 / 18.1.1 |
| flutter_secure_storage / file_picker | 11.2.0 / 13.1.0 |
| flutter_markdown_plus / url_launcher | 1.0.12 / 6.3.3 |
| Package tests / app test runner | test 1.32.0 / Flutter SDK test + test 1.31.1 |

Compatible package versions are locked; newer versions reported by pub that conflict with selected SDK constraints were not forced. Official references checked during implementation: [Flutter stable archive](https://docs.flutter.dev/install/archive), [Dio](https://pub.dev/packages/dio), [Riverpod](https://pub.dev/packages/flutter_riverpod), [go_router](https://pub.dev/packages/go_router), [secure storage/backup guidance](https://pub.dev/packages/flutter_secure_storage), [file-picker migration notes](https://pub.dev/packages/file_picker/changelog), [Android Gradle compatibility](https://developer.android.com/build/releases/agp-9-1-0-release-notes), [AndroidX test releases](https://developer.android.com/jetpack/androidx/releases/test). The new workflow uses versions shown in the action maintainers' documentation: [checkout](https://github.com/actions/checkout), [setup-java](https://github.com/actions/setup-java), [upload-artifact](https://github.com/actions/upload-artifact), [Flutter action](https://github.com/subosito/flutter-action). No hosted Actions execution is claimed.

Remaining verification / authorized release work:

- Retrieve Figma context/screenshots when its connector is available and compare all principal screens at the 412×892 design reference. The implementation uses the plan's permitted fallback; exact Figma fidelity is unverified.
- Perform human TalkBack, physical-device, activity recreation/system picker, email-app handoff/failure and comprehensive long-content/keyboard checks. The existing automated cases do not prove every state in the plan's full manual matrix.
- Build/test ARM or a universal debug APK after official engine downloads are available at practical speed. The universal build was interrupted while downloading 180.6 MB ARM64 and 114.7 MB ARMv7 engine jars; x86-64 builds and runtime execution passed.
- Run the dashboard workflow in a hosted repository. Its local equivalents passed, but hosted permissions/network/runner behavior remains unverified.
- Configure the ignored production URL file, private signing and target HTTPS infrastructure before distribution. Release manifests disallow cleartext and backups; production signing and release execution were not performed. Nothing was uploaded to Play Store or deployed publicly.

Setup and troubleshooting are in [dashboard-development.md](dashboard-development.md); phase evidence is in [dashboard-progress.md](dashboard-progress.md); screen mapping and deliberate adaptations are in [dashboard-design.md](dashboard-design.md).

Test cleanup: the fictional test owner was disabled and all tokens revoked, the generated password file removed, and the spawned API/queue processes stopped. The existing PostgreSQL server and pre-existing databases were preserved. The normal APK was restored on the task-started emulator before shutdown. The isolated test database remains available locally; it contains only disposable test/audit metadata and seeded settings.
