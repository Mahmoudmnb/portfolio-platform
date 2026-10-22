# Bannan Studio Android dashboard

See [development instructions](../docs/dashboard-development.md), [design notes](../docs/dashboard-design.md), and [verification report](../docs/dashboard-completion.md).

The API URL is required:

```sh
flutter pub get --enforce-lockfile
flutter run --dart-define=API_BASE_URL=http://10.0.2.2:8000/api/v1
```

This app ships no credentials or sample live data. Bootstrap the owner using the existing backend console command. Backend and website code are independent of this application.
