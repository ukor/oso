import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oso/commons/dtos/app_configuration.dto.dart';
import 'package:oso/main.common.dart';

import 'package:oso/app/firebase_configs/prd_firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const environment = ENVIRONMENTS.production;

  final FirebaseApp firebaseApp = await Firebase.initializeApp(
    name: defaultFirebaseAppName,
    options: DefaultFirebaseOptions.currentPlatform,
  );

  mainCommon(environment: environment, firebaseApp: firebaseApp);
}
