import 'package:get_it/get_it.dart';
import 'package:oso/modules/_example/repositories/example.repository.dart';

import 'main.dart';

Future<void> serviceLocator(GetIt getIt) async {
  getIt.registerLazySingleton(() => ExampleRepository());
}

registerServices() async {
  await ioc.pushNewScopeAsync(init: serviceLocator, scopeName: 'repositories');
}
