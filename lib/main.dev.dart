import 'package:flutter/material.dart';
import 'package:oso/commons/dtos/app_configuration.dto.dart';
import 'package:oso/main.common.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const environment = ENVIRONMENTS.development;

  mainCommon(environment: environment);
}
