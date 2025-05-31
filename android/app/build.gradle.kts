// See - https://developer.android.com/build
// See - https://docs.flutter.dev/deployment/android
// See - https://codewithandrea.com/articles/flutter-android-gradle-kts/

import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    // START: FlutterFire Configuration
    id("com.google.gms.google-services")
    id("com.google.firebase.firebase-perf")
    id("com.google.firebase.crashlytics")
    // END: FlutterFire Configuration
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

android {
    namespace = "com.achota.oso"
    compileSdk = flutter.compileSdkVersion
    // ndkVersion = flutter.ndkVersion
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    signingConfigs {
        create("release") {
            keyAlias = keystoreProperties["keyAlias"] as String
            keyPassword = keystoreProperties["keyPassword"] as String
            storeFile = keystoreProperties["storeFile"]?.let { file(it) }
            storePassword = keystoreProperties["storePassword"] as String
        }
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
            signingConfig = signingConfigs.getByName("debug")
            // signingConfig signingConfigs.debug
        }
        release {
            signingConfig = signingConfigs.getByName("release")
            // signingConfig signingConfigs.release
            ndk {
                debugSymbolLevel = "FULL"
                abiFilters += listOf("armeabi-v7a", "arm64-v8a", "x86", "x86_64")
            }
        }
    }

    flavorDimensions += "oso"
    productFlavors {
        create("development") {
            dimension = "oso"
            applicationIdSuffix = ".dev"
            resValue(type = "string", name = "app_name", value = "Oso dev")
            versionNameSuffix = ".dev"
            versionCode = flutter.versionCode
            versionName = flutter.versionName
        }
        create("staging") {
            dimension = "oso"
            applicationIdSuffix = ".stg"
            resValue(type = "string", name = "app_name", value = "Oso stg")
            versionNameSuffix = ".stg"
            versionCode = flutter.versionCode
            versionName = flutter.versionName
            ndk {
                debugSymbolLevel = "FULL"
                abiFilters += listOf("armeabi-v7a", "arm64-v8a", "x86", "x86_64")
            }
        }
        create("production") {
            dimension = "oso"
            applicationIdSuffix = ""
            resValue(type = "string", name = "app_name", value = "Oso")
            versionNameSuffix = ""
            versionCode = flutter.versionCode
            versionName = flutter.versionName
            ndk {
                debugSymbolLevel = "FULL"
                abiFilters += listOf("armeabi-v7a", "arm64-v8a", "x86", "x86_64")
            }
        }
    }
}

flutter {
    source = "../.."
}
