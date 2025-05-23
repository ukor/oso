import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:oso/app/app.dart';
import 'package:oso/app/service_locators/init.locator.dart';

import 'app/service_locators/main.dart';
import 'app/service_locators/service.locator.dart';
import 'commons/dtos/app_configuration.dto.dart';

Future<void> mainCommon({
  required ENVIRONMENTS environment,
  // required FirebaseApp firebaseApp,
}) async {
  final log = Logger();

  await initLocator(environment: environment);
  await registerServices();

  /// Should always come after registering services with GetIt
  await locator.allReady();

  // final appConfig = locator.get<AppConfiguration>();

  runApp(OsoApp());

  FlutterError.onError = (errorDetails) {
    log.f(errorDetails);
    // FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    log.f(error, stackTrace: stack);
    // FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
}
