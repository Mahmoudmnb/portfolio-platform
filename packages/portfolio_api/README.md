# portfolio_api

Pure Dart API client for the existing `/api/v1` Laravel contract. Dio transport is injectable; credentials are supplied by the host application. Importing this package creates no session. Response models have no write serializer. `WritePayload` whitelists each request schema; `patchDiff` distinguishes omitted fields, explicit nulls and full array replacements.

Run `dart pub get --enforce-lockfile`, `dart analyze --fatal-infos`, and `dart test` in this directory. From the repository root, regenerate response models/request metadata with `python3 packages/portfolio_api/tool/generate_contract.py`, then `dart format packages/portfolio_api/lib/src`.

The guarded `tool/smoke.dart` requires a disposable loopback API, PostgreSQL, a running queue worker and securely injected test credentials. See the dashboard development guide. No automatic retries of writes are performed.
