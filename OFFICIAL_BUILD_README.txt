FLUTTERTEST OFFICIAL BUILD KIT
==============================

This is the exact FlutterTest source exported by CodeForge, plus two build helpers.
No Dart source was rewritten.

Verified from the uploaded project:
- Dart package: cf_fluttertest
- Android app ID planned by CodeForge: com.codeforge.generated.cf_fluttertest
- User edit is present in lib/screens/home_screen.dart:
  "Edited Text to make sure it works."
- Home -> Details navigation source is present.
- widget_test.dart still checks the original "Built with CodeForge" text, which is still present.
- tool/bootstrap_android.sh passes bash syntax checking.

BUILD OPTION A: GITHUB ACTIONS
------------------------------
1. Create an empty GitHub repository later when convenient.
2. Upload the CONTENTS of this folder to the repository root.
3. Commit/push to main.
4. GitHub Actions -> Flutter Android Build -> Run workflow.
5. Download the artifact named FlutterTest-release-apk.

The workflow pins Flutter 3.47.5 stable and runs:
  bash tool/bootstrap_android.sh
  flutter build apk --release

BUILD OPTION B: OFFICIAL FLUTTER HOST
-------------------------------------
On Linux/macOS/Windows WSL with the official Flutter SDK on PATH:
  bash tool/build_official_flutter.sh

Expected APK:
  build/app/outputs/flutter-apk/app-release.apk

IMPORTANT
---------
This is a TEST release APK milestone, not a Google Play release package yet.
Before Play publishing we still need a permanent application ID decision,
release/upload signing, launcher assets, API/manifest review, privacy/data-safety
review, versioning, and an AAB build.
