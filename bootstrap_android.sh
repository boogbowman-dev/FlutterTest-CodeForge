#!/usr/bin/env bash
# Run on a supported host with the OFFICIAL Flutter SDK, not inside CodeForge.
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SETTINGS="$ROOT/codeforge_flutter.properties"
command -v flutter >/dev/null || { echo 'STOP: official Flutter SDK is not on PATH'; exit 1; }
[ -f "$SETTINGS" ] || { echo 'STOP: CodeForge Flutter settings missing'; exit 1; }
PROJECT_NAME="$(sed -n 's/^project.name=//p' "$SETTINGS" | head -1)"
ORG="$(sed -n 's/^org=//p' "$SETTINGS" | head -1)"
[[ "$PROJECT_NAME" =~ ^[a-z][a-z0-9_]+$ ]] || { echo 'STOP: invalid project.name'; exit 1; }
[[ "$ORG" =~ ^[A-Za-z][A-Za-z0-9_]*(\.[A-Za-z][A-Za-z0-9_]*)+$ ]] || { echo 'STOP: invalid org'; exit 1; }
[ ! -e "$ROOT/android" ] || { echo 'STOP: android/ already exists; bootstrap will not overwrite it'; exit 1; }
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
echo 'Creating Android host files with official Flutter…'
flutter create --platforms=android --project-name "$PROJECT_NAME" --org "$ORG" "$TMP/scaffold"
cp -R "$TMP/scaffold/android" "$ROOT/android"
[ ! -f "$TMP/scaffold/.metadata" ] || cp "$TMP/scaffold/.metadata" "$ROOT/.metadata"
cd "$ROOT"
flutter pub get
flutter analyze
flutter test
echo 'READY: flutter build apk  |  flutter build appbundle'
