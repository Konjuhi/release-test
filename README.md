# release_test

Flutter app prepared for Firebase on Android and iOS.

## Firebase setup

1. Reauthenticate the Firebase CLI if needed:
   `firebase login --reauth`
2. Generate the platform config files:
   `~/.pub-cache/bin/flutterfire configure --project release-test-d867d --platforms=android,ios --android-package-name=com.arditkonjuhi.releasetest --ios-bundle-id=com.arditkonjuhi.releasetest`
3. This command generates `lib/firebase_options.dart`, `android/app/google-services.json`, and `ios/Runner/GoogleService-Info.plist`.

## Release builds

- Android: `flutter build apk --release`
- iOS: `flutter build ipa`

Helper scripts:

- `./tool/build_android_release.sh`
- `./tool/build_ios_release.sh`

## Firebase App Distribution

Distribute a built Android APK:

`firebase appdistribution:distribute build/app/outputs/flutter-apk/app-release.apk --app 1:173295985393:android:5b555aabb397fb09ec7f50`

Or with the helper script:

`FIREBASE_ANDROID_APP_ID=1:173295985393:android:5b555aabb397fb09ec7f50 ./tool/distribute_android.sh`

Distribute a built iOS IPA:

`firebase appdistribution:distribute build/ios/ipa/Runner.ipa --app 1:173295985393:ios:bca1fb156d74f88eec7f50`

Or with the helper script:

`FIREBASE_IOS_APP_ID=1:173295985393:ios:bca1fb156d74f88eec7f50 ./tool/distribute_ios.sh`

## Auto-distribute on push

The repo now includes a GitHub Actions workflow:

- `.github/workflows/firebase_app_distribution_android.yml`

It runs on every push to the `main` branch and uploads the Android APK to Firebase App Distribution.

Required GitHub repository secret:

- `FIREBASE_SERVICE_ACCOUNT_JSON`

Create it from a Firebase service account JSON key with access to project `release-test-d867d`.

If your branch is not named `main`, change the trigger in the workflow file.

Notes:

- Android automation is ready now.
- iOS automation needs Apple signing certificates and provisioning profiles configured in CI before `flutter build ipa` can run on GitHub Actions.
