#!/bin/sh
set -eu

: "${FIREBASE_ANDROID_APP_ID:?Set FIREBASE_ANDROID_APP_ID before running this script.}"

firebase appdistribution:distribute \
  build/app/outputs/flutter-apk/app-release.apk \
  --app "$FIREBASE_ANDROID_APP_ID"
