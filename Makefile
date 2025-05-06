.DEFAULT_GOAL := default

default:
	@echo "Attach a target"

install:
	.fvm/flutter_sdk/bin/flutter pub get

clean:
	@echo "Deleting all flutter cache"
	.fvm/flutter_sdk/bin/flutter clean
	.fvm/flutter_sdk/bin/flutter clean cache

clean-ios:
	@echo "Deleting flutter cache and ios cache"
	.fvm/flutter_sdk/bin/flutter clean
	.fvm/flutter_sdk/bin/flutter clean cache
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
	.fvm/flutter_sdk/bin/flutter build appbundle --flavor production -t ./lib/main_prd.dart --release --obfuscate --split-debug-info=./
build-ios:
	.fvm/flutter_sdk/bin/flutter build ipa --flavor production -t ./lib/main_prd.dart --release --obfuscate --split-debug-info=./ --export-method=app-store
build-stg-ios:
	.fvm/flutter_sdk/bin/flutter build ipa --flavor staging -t ./lib/main_stg.dart --release --obfuscate --split-debug-info=./ --export-method=app-store

build-dev-android:
	.fvm/flutter_sdk/bin/flutter build apk --flavor development -t ./lib/main_dev.dart --release --obfuscate --split-debug-info=./

build-stg-android:
	.fvm/flutter_sdk/bin/flutter build apk --flavor staging -t ./lib/main_stg.dart --release --obfuscate --split-debug-info=./

run-dev-chrome:
	.fvm/flutter_sdk/bin/flutter run -d chrome --target=lib/main.dev.dart --web-browser-flag "--new-window=false"

generate:
	@echo "Running build runner"
	.fvm/flutter_sdk/bin/dart run build_runner build --delete-conflicting-outputs

build: generate build-android build-ios

generate-launcher-icons:
	.fvm/flutter_sdk/bin/flutter pub run flutter_launcher_icons -f flutter_launcher_icons.yaml

generate-splash-screens:
	.fvm/flutter_sdk/bin/flutter pub run flutter_native_splash:create --flavors development,staging,production


firebase-dev:
	dart pub global activate flutterfire_cli
	flutterfire configure --project=sal-love-zone --out=lib/firebase_configs/dev_firebase_options.dart --android-package-name=com.saltechapps.loveZone.dev --ios-bundle-id=com.saltechapps.loveZone.dev

firebase-stg:
	dart pub global activate flutterfire_cli
	flutterfire configure --project=sal-love-zone --out=lib/firebase_configs/stg_firebase_options.dart --android-package-name=com.saltechapps.loveZone.stg --ios-bundle-id=com.saltechapps.loveZone.stg

firebase-prd:
	dart pub global activate flutterfire_cli
	flutterfire configure --project=sal-love-zone --out=lib/firebase_configs/prd_firebase_options.dart --android-package-name=com.saltechapps.loveZone --ios-bundle-id=com.saltechapps.loveZone

firebase: firebase-dev firebase-stg firebase-prd