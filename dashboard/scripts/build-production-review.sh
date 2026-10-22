#!/bin/sh
set -eu
cd "$(dirname "$0")/.."
flutter pub get --enforce-lockfile
# Ordinary lib/main.dart is Flutter's default target. No driver or live smoke.
flutter build apk --debug --target-platform android-arm64 \
  --dart-define=API_BASE_URL=https://api.mahmoudbannan.com/api/v1
# Reject stray JNI ABIs before labelling this artifact ARM64.
task_review_abis=$(unzip -Z1 build/app/outputs/flutter-apk/app-debug.apk | sed -n 's@^lib/\([^/]*\)/.*\.so$@\1@p' | sort -u)
if [ "$task_review_abis" != "arm64-v8a" ]; then
  echo 'Review APK must contain only arm64-v8a native libraries.' >&2
  exit 1
fi
mkdir -p build/review
cp build/app/outputs/flutter-apk/app-debug.apk build/review/bannan-studio-production-arm64-debug.apk
sha256sum build/review/bannan-studio-production-arm64-debug.apk > build/review/bannan-studio-production-arm64-debug.apk.sha256
cat build/review/bannan-studio-production-arm64-debug.apk.sha256
