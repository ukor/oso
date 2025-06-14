.DEFAULT_GOAL := default

# --- Variables ---
# Define common paths and tools to reduce repetition and make updates easier
FVM_FLUTTER := .fvm/flutter_sdk/bin/flutter
FVM_DART := .fvm/flutter_sdk/bin/dart

# --- Default Target ---
default:
	@echo "========================================"
	@echo " Flutter Project Makefile"
	@echo "----------------------------------------"
	@echo " Available targets:"
	@echo "  install                  - Get Flutter project dependencies"
	@echo "  clean                    - Delete all Flutter caches"
	@echo "  clean-ios                - Delete Flutter and iOS caches (Pods, Podfile.lock)"
	@echo "  clean-build              - Delete all generated build artifacts"
	@echo "  pod-install-mchip        - Run pod install for Apple Silicon (M-chip)"
	@echo "  pod-install-intel-chip   - Run pod install for Intel-based Macs"
	@echo "  generate                 - Run build_runner for code generation"
	@echo "  generate-launcher-icons  - Generate app launcher icons"
	@echo "  generate-splash-screens  - Generate native splash screens for all flavors"
	@echo "  firebase-dev             - Configure Firebase for development"
	@echo "  firebase-stg             - Configure Firebase for staging"
	@echo "  firebase-prd             - Configure Firebase for production"
	@echo "  firebase                 - Configure Firebase for all environments"
	@echo ""
	@echo "  build                    - Perform a full production build (generate, android, ios)"
	@echo "  build-android            - Build production Android App Bundle (.aab)"
	@echo "  build-ios                - Build production iOS IPA (App Store)"
	@echo "  build-stg-ios            - Build staging iOS IPA"
	@echo "  build-dev-android        - Build development Android APK"
	@echo "  build-stg-android        - Build staging Android APK"
	@echo ""
	@echo "  run-dev-chrome           - Run development app in Chrome browser"
	@echo "  test                     - Run all Flutter tests"
	@echo "  format                   - Format Dart code"
	@echo "  analyze                  - Analyze Dart code for issues"
	@echo "========================================"
	@echo "Attach a target, e.g., 'make install'"

install:
	$(FVM_FLUTTER)  pub get

clean:
	@echo "Deleting all flutter cache"
	$(FVM_FLUTTER)  clean
	$(FVM_FLUTTER)  clean cache

clean-ios:
	@echo "Deleting flutter cache and ios cache"
	$(FVM_FLUTTER)  clean
	$(FVM_FLUTTER)  clean cache
	rm -rf ./ios/Pods ./ios/Podfile.lock

pod-install-mchip:
	cd ios/
	arch -x86_64 pod install --repo-update
	cd ../

pod-install-intel-chip:
	cd ios/
	pod install --repo-update
	cd ../

clean-build:
	@echo "Delete ./build"
	rm -rf .dart_tool/build
	rm -rf .dart_tool/flutter_build
	rm -rf ./build

build-android:
	$(FVM_FLUTTER)  build appbundle --flavor production -t ./lib/main.prd.dart --release --obfuscate --split-debug-info=./
build-ios:
	$(FVM_FLUTTER)  build ipa --flavor production -t ./lib/main.prd.dart --release --obfuscate --split-debug-info=./ --export-method=app-store
build-stg-ios:
	$(FVM_FLUTTER)  build ipa --flavor staging -t ./lib/main.stg.dart --release --obfuscate --split-debug-info=./ --export-method=app-store

build-dev-android:
	$(FVM_FLUTTER)  build apk --flavor development -t ./lib/main.dev.dart --release --obfuscate --split-debug-info=./

build-stg-android:
	$(FVM_FLUTTER)  build apk --flavor staging -t ./lib/main.stg.dart --release --obfuscate --split-debug-info=./

run-dev-chrome:
	$(FVM_FLUTTER)  run -d chrome --target=lib/main.dev.dart --web-browser-flag "--new-window=false"

generate:
	@echo "Running build runner"
	$(FVM_DART)  run build_runner build --delete-conflicting-outputs

build: generate build-android build-ios

generate-launcher-icons:
	$(FVM_FLUTTER)  pub run flutter_launcher_icons -f flutter_launcher_icons.yaml

generate-splash-screens:
	$(FVM_FLUTTER)  pub run flutter_native_splash:create --flavors development,staging,production


firebase-dev:
	dart pub global activate flutterfire_cli
	flutterfire configure --project=oso-achota --out=lib/app/firebase_configs/dev_firebase_options.dart --ios-out=ios/configs/development/GoogleService-Info.plist --android-out=android/app/src/development/google-services.json --android-package-name=com.achota.oso.dev --ios-bundle-id=com.achota.oso.dev

firebase-stg:
	dart pub global activate flutterfire_cli
	flutterfire configure --project=oso-achota --out=lib/app/firebase_configs/stg_firebase_options.dart --ios-out=ios/configs/staging/GoogleService-Info.plist --android-out=android/app/src/staging/google-services.json --android-package-name=com.achota.oso.stg --ios-bundle-id=com.achota.oso.stg

firebase-prd:
	dart pub global activate flutterfire_cli
	flutterfire configure --project=oso-achota --out=lib/app/firebase_configs/prd_firebase_options.dart --ios-out=ios/configs/production/GoogleService-Info.plist --android-out=android/app/src/production/google-services.json --android-package-name=com.achota.oso --ios-bundle-id=com.achota.oso

firebase: firebase-dev firebase-stg firebase-prd

.PHONY: default install clean clean-ios clean-build pod-install-mchip pod-install-intel-chip generate generate-launcher-icons generate-splash-screens build build-android build-ios build-stg-ios build-dev-android build-stg-android run-dev-chrome firebase-dev firebase-stg firebase-prd firebase test format analyze