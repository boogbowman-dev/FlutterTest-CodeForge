# FlutterTest

Flutter source project created on-device by CodeForge.

## Project identity

- Dart package: `cf_fluttertest`
- Organization: `com.codeforge.generated`
- Planned Android application ID: `com.codeforge.generated.cf_fluttertest`

## Edit on the phone

Start with `lib/main.dart` and the files in `lib/screens/`. CodeForge can edit and export these without a Flutter SDK installed on Android.

## Hydrate Android on an official Flutter host

The `android/` folder is intentionally not generated on the phone. On Linux, macOS, or Windows with the official Flutter SDK installed, run:

```bash
bash tool/bootstrap_android.sh
flutter build apk
```

For a Play release later, configure release signing and then use `flutter build appbundle`.

Do not publish the first test build as-is. App identity, release signing, icons, policy metadata, target SDK, and store listing still need a release pass.
