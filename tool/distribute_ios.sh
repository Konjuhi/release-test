#!/bin/sh
set -eu

: "${FIREBASE_IOS_APP_ID:?Set FIREBASE_IOS_APP_ID before running this script.}"

firebase appdistribution:distribute \
  build/ios/ipa/Runner.ipa \
  --app "$FIREBASE_IOS_APP_ID"
