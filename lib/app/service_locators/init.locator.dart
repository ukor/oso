import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:oso/app/navigation/main.dart';
import 'package:oso/commons/dtos/app_configuration.dto.dart';

import 'main.dart';

Future<void> initLocator({
  required ENVIRONMENTS environment,
  // required FirebaseApp firebaseApp,
}) async {
  // if (environment != ENVIRONMENTS.production) {
  //   // Only call clearSavedSettings() during testing to reset internal values.
  //   await Upgrader.clearSavedSettings();
  // }

  ioc.registerSingletonAsync<AppConfiguration>(
    () => AppConfiguration.forEnvironment(environment.name),
  );

  await ioc.isReady<AppConfiguration>();

  ioc.registerSingleton<GoRouter>(router());

  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('poppins/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
}
