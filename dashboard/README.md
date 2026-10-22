# Bannan Studio Android dashboard

See [development instructions](../docs/dashboard-development.md), [design notes](../docs/dashboard-design.md), and [verification report](../docs/dashboard-completion.md).

The API URL is required:

```sh
flutter pub get --enforce-lockfile
flutter run --dart-define=API_BASE_URL=http://10.0.2.2:8000/api/v1
```

This app ships no credentials or sample live data. Bootstrap the owner using the existing backend console command. Backend and website code are independent of this application.

Production-connected ARM64 debug review build (ordinary `lib/main.dart`):

```sh
cd dashboard # when starting at the repository root
sh scripts/build-production-review.sh
```

Output: `dashboard/build/review/bannan-studio-production-arm64-debug.apk` and its SHA-256 sidecar. This connects to `https://api.mahmoudbannan.com/api/v1`; it is a debug review artifact, not a privately signed distribution release. See [production preparation and results](../docs/dashboard-production-review.md) before installing or signing in. Local development above remains available.
