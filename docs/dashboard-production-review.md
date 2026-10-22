# Production-connected Android review — 2026-10-22

Target: `https://api.mahmoudbannan.com/api/v1`. This task prepares the existing Flutter Android dashboard; backend, website and OpenAPI files remain unchanged. Root backend-only scope is superseded for this task by the explicit dashboard request. No owner credentials are embedded or read from backend/.env.

## Reproduce

Use Flutter 3.47.7 / Dart 3.13.5, JDK 17 and the existing Android SDK/locked dependencies. From `dashboard/`:

```sh
flutter pub get --enforce-lockfile
flutter build apk --debug --target-platform android-arm64 \
  --dart-define=API_BASE_URL=https://api.mahmoudbannan.com/api/v1
```

The ordinary target is `lib/main.dart`. `sh scripts/build-production-review.sh` executes that exact build, copies the APK to `build/review/bannan-studio-production-arm64-debug.apk`, and writes a `.sha256` sidecar. CI uses the same script and labels its artifact as a production-connected ARM64 debug review. Building does not log in or mutate the API. Locked versions and commands are reproducible inputs; byte-for-byte identical debug APKs across machines/timestamps are not promised.

Local development is still explicit and separate:

```sh
flutter run --dart-define=API_BASE_URL=http://10.0.2.2:8000/api/v1
flutter build apk --debug --target-platform android-arm64 \
  --dart-define=API_BASE_URL=http://10.0.2.2:8000/api/v1
```

Local backend/media must be reachable from the device. Production requires no adb reverse mapping or disposable backend. `config/production.example.json` now contains the deployed public endpoint; it contains no secret. For private signing/custom configuration, copy it to ignored `config/production.json` and follow [release preparation](dashboard-release-preparation.md). Release guards require HTTPS, normal main.dart and existing private signing inputs; no debug-signing fallback is provided. No private signing configuration was available in this task and no release signing key was generated.

## URL, credential and media behavior

- Compile-time API_BASE_URL includes `/api/v1` once. Login resolves to `/api/v1/admin/auth/login` and me to `/api/v1/admin/auth/me`; endpoint paths are API-relative. Tests inspect actual constructed request URIs against the deployed origin using an injected transport, without sending production login requests.
- Login has no saved bearer; protected requests use the stored token only on the configured API. Absolute/external paths and redirects are rejected. Default certificate verification is unchanged; no certificate bypass or custom trust-all adapter exists.
- Android release disables cleartext. HTTPS-configured debug reviews now also disable cleartext through the merged debug manifest; local HTTP debug remains supported. Emulator `10.0.2.2` is also rejected as a release host.
- Tokens stay in flutter_secure_storage with Android Keystore protection and an explicit server binding. There is no in-app server switch: rebuilding with another URL causes bootstrap to clear any mismatched stored credential before me is requested. Clearing also cancels requests, purges drafts/user state and increments privateGeneration to rebuild private navigation/caches. Development tokens cannot be sent to production, or vice versa. Passwords are never persisted. Existing Android backup/cloud/device-transfer exclusions are retained.
- Ready media uses the absolute server-returned URL, including a legitimate CDN URL; it is never appended to the API prefix. Public Image.network requests have no bearer headers. HTTPS APIs now reject HTTP media URLs rather than silently downgrade; local HTTP media remains supported for local APIs. Null/unsafe URLs show a placeholder. Actual hosted media files were not fetched because this task permits production health checks only.
- Upload byte completion and server image processing are distinct. Processing remains pending even after the polling window. Polling uses 2/3/5-second backoff, stops after two minutes or 25 follow-up checks, and pauses/cancels on background/disposal. Each request retains its bounded network timeout. Check again begins another bounded window; users are told not to re-upload a slow job. Only an explicit backend failed status displays failure guidance. The widget test proves delayed processing stops polling, remains processing, and can become ready after Check again.

## Actual verification

- `dart format --output=none --set-exit-if-changed ...`: passed, 31 files checked, zero changes.
- Shared client: `dart analyze --fatal-infos` clean; **32 tests passed**.
- Dashboard: `flutter analyze --fatal-infos` clean; **37 tests passed**.
- Regression coverage includes production URI construction, unauthenticated login, bearer confinement, redirect rejection, HTTPS/media policy, server mismatch credential/draft clearing, slow-processing polling/Check again and actual terminal failure.
- Read-only unauthenticated `GET https://api.mahmoudbannan.com/api/v1/ready`: **HTTP 200**, body `{"data":{"ready":true}}`, curl TLS verification result **0**. No redirects were followed; certificate verification was not disabled.
- Release preflight with the valid production URL correctly refused missing private signing inputs; no release was built.
- Production JSON, Android backup/extraction rules and absence of a certificate bypass were inspected successfully.
- Shell syntax and diff whitespace checks passed. SHA-256 preservation checks found no changes in tracked backend, website or OpenAPI files.

Build dependency note: the first Gradle invocation was stopped while downloading the large ARM64 engine at very low speed. A temporary local Maven mirror supplied the same official engine archive, reconstructed from already installed matching SDK entries and verified against the HTTPS official storage MD5 (`5b07442061735939e5b60227b5a587b3`); archive SHA-256 `e58ef2523b336de488f6d19df27a63c032cfe6c09e1d55c26b6a4f22dc735695`. The final build used a uniquely named temporary Gradle init script for that mirror, removed automatically afterward; no mirror or SDK/cache configuration is committed. Normal build/CI commands resolve the artifact from Flutter's official repository. No native binary was patched.

## Review artifact

- APK: `dashboard/build/review/bannan-studio-production-arm64-debug.apk`.
- Checksum sidecar: `dashboard/build/review/bannan-studio-production-arm64-debug.apk.sha256`.
- Size: **100,741,625 bytes**.
- ABI: **arm64-v8a only**; every packaged native library has AArch64 ELF machine ID 183.
- SHA-256: `8ffcddf78fac50fddeb9d5bbb3b5e6d7812dedcd50b653d6173d475b819d8400`.
- Package/version: `com.mahmoudbannan.portfolio_admin`, 1.0.0 (1); min SDK 24, target/compile SDK 36.
- `apksigner verify`: passed; signer is **Android Debug**, APK v2 signature verified. Debuggable is true, as required for this review build.
- Packaged manifest: cleartext traffic false, allowBackup false, fullBackupContent false, dataExtractionRules retained.
- Kernel inspection: deployed API URL present; previous local/disposable URL configurations and the test-driver entry point/library absent. Flutter's framework documentation contains a driver-related symbol reference; that text is not an enabled driver extension.
- The initial APK exposed extra third-party JNI ABIs even with Flutter's ARM64 flag. Android filtering now follows explicit target-platform values and leaves split builds intact; the final APK was rebuilt and inspected. The build script rejects extra ABIs before copying a review artifact.
- Offline Gradle verification passed for local HTTP debug and the android-x64 emulator JNI filter. No production API request was involved.
- Artifacts remain ignored by Git; no APK or signing material was committed.


## Remaining acceptance

An emulator is connected; no physical ARM64 device was available for this task. No app login, uploads, settings writes, destructive smoke workflow or authenticated requests were run against production. A person must install the review APK on the intended ARM64 phone and deliberately verify login/logout, secure-storage restart behavior, API navigation, existing ready HTTPS media, background/resume, and long processing/Check again during an approved upload. Check account-specific Hostinger cron latency and any API/image TLS issues on that device.

The artifact is a production-connected **debug review APK**, signed with Android's development/debug identity. It is not a privately signed distribution release. Private release-signing/certificate verification, release APK/AAB build, physical-device acceptance and hosted CI execution remain unperformed. Never distribute this debug build as a production release. Installing over a build with a different signing identity requires an intentional migration/uninstall; uninstall clears local credentials/drafts. Do not delete an existing installation without considering its local unsaved work.
