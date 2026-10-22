# Dashboard release preparation

Finishing verification: 2026-10-21. No release identity, signed production artifact or publication was created.

Development and review builds use an explicit compile-time API URL. The finishing emulator build uses `http://127.0.0.1:18082/api/v1` with `adb reverse tcp:18082 tcp:18082`. This also works for a USB-connected phone with that reverse mapping and a running development backend. The disposable backend must return image URLs on the same reachable origin. The task's temporary owner/API are disabled/stopped after QA; the artifact alone is not a working hosted demo. Recreate a disposable backend and owner before review. Changing API_BASE_URL requires rebuilding.

From `dashboard/`, ordinary ARM64 review command:

```sh
adb reverse tcp:18082 tcp:18082
flutter build apk --debug --target-platform android-arm64 \
  --dart-define=API_BASE_URL=http://127.0.0.1:18082/api/v1
```

Debug permits development HTTP. Main/release manifests disable cleartext, backups and cloud/device-transfer credential restoration. TLS certificate verification remains enabled. The ordinary entry point is `lib/main.dart`; test_driver/app.dart is restricted to local APIs and must never be distributed.

For an authorized release, copy `config/production.example.json` to ignored `config/production.json` and set its initially empty API_BASE_URL to the legitimate HTTPS endpoint ending `/api/v1`. Empty URLs, HTTP, localhost and documentation placeholder hosts fail validation. Formatting validation does not prove that an endpoint exists, is controlled by the operator or has a valid live certificate.

Private Gradle signing accepts either the four environment inputs below or ignored `android/key.properties`, based on `android/key.properties.example`. Environment values take precedence. Use an absolute keystore path to avoid ambiguous relative resolution.

| Property | Environment input |
| --- | --- |
| storeFile | BANNAN_KEYSTORE_FILE |
| storePassword | BANNAN_STORE_PASSWORD |
| keyAlias | BANNAN_KEY_ALIAS |
| keyPassword | BANNAN_KEY_PASSWORD |

Populate these through a private secret manager or local ignored file. Do not paste passwords into command lines, logs, CI artifacts or Git. The task does not generate or choose a distribution certificate. Retain the existing identity, alias and passwords in restricted, independently recoverable backups; test restoration privately. Losing an app signing key may prevent updates to installed applications. With Play App Signing, recovery of an upload key and custody of the app signing key are different operations; follow the account's actual enrollment and recovery policy.

Available preflight (from dashboard/android):

```sh
./gradlew :app:validateReleasePreparation -Ptarget=lib/main.dart \
  -Pdart-defines="$(python3 -c 'import base64,json; print(base64.b64encode(("API_BASE_URL="+json.load(open("../config/production.json"))["API_BASE_URL"]).encode()).decode())')"
```

This validates URL syntax, the ordinary target, presence of signing inputs and existence of the chosen keystore file. It does not print their contents, validate the certificate, contact the API or create an artifact. Release tasks perform the same guard automatically; there is no debug-signing fallback.

Only after legitimate endpoint/signing inputs and authorization are available:

```sh
flutter build appbundle --release --target=lib/main.dart \
  --dart-define-from-file=config/production.json
```

Then inspect the certificate fingerprint, release manifest/debuggability/cleartext/backup rules, ABI set and absence of driver code/embedded credentials. Test HTTPS API and public image reachability on the intended physical device. Record artifact size/hash and signing fingerprint privately as appropriate. These signed execution checks remain pending. Store upload, public distribution and backend deployment require separate authorization.
