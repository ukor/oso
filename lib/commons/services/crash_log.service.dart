import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

class CrashLog {
  final FirebaseCrashlytics crashlytic;

  CrashLog._(this.crashlytic);

  static Future<CrashLog> initialize() async {
    final crashlyticsInstance = FirebaseCrashlytics.instance;

    try {
      await crashlyticsInstance.setCrashlyticsCollectionEnabled(true);
    } catch (e) {
      debugPrint('Error setting crashlyticsCollection: $e');
    }

    if (!kDebugMode) {
      // Pass all uncaught errors from the Flutter framework to Crashlytics.
      FlutterError.onError = crashlyticsInstance.recordFlutterFatalError;

      // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics.
      PlatformDispatcher.instance.onError = (error, stack) {
        crashlyticsInstance.recordError(error, stack, fatal: true);
        return true;
      };
    }

    return CrashLog._(crashlyticsInstance);
  }

  void setUser(String userId) {
    crashlytic.setUserIdentifier(userId);
  }

  void log(String e) {
    crashlytic.log(e);
  }

  Future<void> error(dynamic e, {StackTrace? stack, dynamic reason}) async {
    await crashlytic.recordError(e, stack, reason: reason);
  }

  Future<void> fatalError(
    dynamic exception, {
    StackTrace? stack,
    dynamic reason,
  }) async {
    await crashlytic.recordError(exception, stack, reason: reason, fatal: true);
  }
}
