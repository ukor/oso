import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:oso/app/app.dart';
import 'package:oso/app/service_locators/init.locator.dart';

import 'app/service_locators/main.dart';
import 'app/service_locators/service.locator.dart';
import 'commons/dtos/app_configuration.dto.dart';

Future<void> mainCommon({
  required ENVIRONMENTS environment,
  required FirebaseApp firebaseApp,
}) async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  final log = Logger();

  await initLocator(environment: environment, firebaseApp: firebaseApp);
  await registerServices();

  /// Should always come after registering services with GetIt
  await locator.allReady();

  // final appConfig = locator.get<AppConfiguration>();

  runApp(OsoApp());

  log.i('App starting');
}
