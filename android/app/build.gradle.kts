plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.achota.oso"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.achota.oso"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        debug {
            // signingConfig = signingConfigs.getByName("debug")
            signingConfig signingConfigs.debug
        }
        release {
            // signingConfig = signingConfigs.getByName("release")
            signingConfig signingConfigs.release
            ndk {
                debugSymbolLevel "FULL"
                abiFilters "armeabi-v7a", "arm64-v8a", "x86", "x86_64"
            }
        }
    }

    flavorDimensions "oso"
    productFlavors {
        development {
            dimension "oso"
            applicationIdSuffix ".dev"
            resValue "string", "app_name", "Oso Dev"
            versionNameSuffix ".dev"
            versionCode flutterVersionCode.toInteger()
            versionName flutterVersionName
        }
        staging {
            dimension "oso"
            applicationIdSuffix ".stg"
            resValue "string", "app_name", "Oso Stg"
            versionNameSuffix ".stg"
            versionCode flutterVersionCode.toInteger()
            versionName flutterVersionName
            ndk {
                debugSymbolLevel "FULL"
                abiFilters "armeabi-v7a", "arm64-v8a", "x86", "x86_64"
            }
        }
        production {
            dimension "oso"
            applicationIdSuffix ""
            resValue "string", "app_name", "Oso"
            versionNameSuffix ""
            versionCode flutterVersionCode.toInteger()
            versionName flutterVersionName
            ndk {
                debugSymbolLevel "FULL"
                abiFilters "armeabi-v7a", "arm64-v8a", "x86", "x86_64"
            }
        }
}

flutter {
    source = "../.."
}
