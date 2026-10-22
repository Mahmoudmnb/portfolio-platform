# Dashboard release preparation

Finishing verification: 2026-10-21. No private release identity, signed distribution artifact or publication was created. The later production-connected debug review is documented separately.

The production API is `https://api.mahmoudbannan.com/api/v1`. Build-time API_BASE_URL is mandatory; no runtime server picker or silent fallback exists. Current commands and artifact evidence are in [production review](dashboard-production-review.md).

From `dashboard/`, production-connected ARM64 **debug review** command:

```sh
flutter build apk --debug --target-platform android-arm64 \
  --dart-define=API_BASE_URL=https://api.mahmoudbannan.com/api/v1
# Adds a clearly named copy and SHA-256 sidecar:
sh scripts/build-production-review.sh
```

Local development remains separate:

```sh
flutter run --dart-define=API_BASE_URL=http://10.0.2.2:8000/api/v1
flutter build apk --debug --target-platform android-arm64 \
  --dart-define=API_BASE_URL=http://10.0.2.2:8000/api/v1
```

The emulator address reaches the development machine, never production. Previous disposable localhost:18082 artifacts are historical. The ordinary entry point is `lib/main.dart`; never use test_driver/app.dart for this review build. HTTPS-configured debug builds disable Android cleartext; only non-HTTPS debug configurations allow development HTTP. Release always requires HTTPS and disables cleartext. Certificate verification, encrypted token storage and backup/transfer exclusions remain enabled. Login receives no saved bearer; authenticated requests target the configured API; returned absolute public media uses a separate image client without bearer headers and cannot downgrade HTTPS.

For an authorized release, copy `config/production.example.json` to ignored `config/production.json`; the example now contains the deployed HTTPS API URL and no credentials. Empty URLs, HTTP, emulator/localhost and documentation placeholder hosts fail release validation. Presence of a URL is not proof that authentication/media works on a device. API_BASE_URL must never contain a username, password, token, query or fragment.

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
