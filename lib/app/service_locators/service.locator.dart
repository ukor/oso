import 'package:get_it/get_it.dart';
import 'package:oso/commons/services/location.service.dart';
import 'package:oso/commons/services/permission.service.dart';
import 'package:oso/modules/_example/services/example.service.dart';

import 'main.dart';

Future<void> serviceLocator(GetIt getIt) async {
  getIt.registerLazySingleton(() => ExampleService());

  getIt.registerLazySingleton(() => PermissionService());
  getIt.registerLazySingleton(() => LocationService());
}

registerServices() async {
  await ioc.pushNewScopeAsync(init: serviceLocator, scopeName: 'services');
}
