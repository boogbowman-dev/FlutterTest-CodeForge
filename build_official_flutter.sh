#!/usr/bin/env bash
# Build FlutterTest on Linux/macOS/Windows WSL with the official Flutter SDK on PATH.
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"
if ! command -v flutter >/dev/null 2>&1; then
  echo 'STOP: official Flutter SDK is not on PATH'
  exit 1
fi
flutter --version
if [ ! -d android ]; then
  bash tool/bootstrap_android.sh
else
  flutter pub get
  flutter analyze
  flutter test
fi
flutter build apk --release
APK="$ROOT/build/app/outputs/flutter-apk/app-release.apk"
[ -s "$APK" ] || { echo 'STOP: release APK not produced'; exit 1; }
echo "SUCCESS: $APK"
