import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oso/app/service_locators/main.dart';


class OsoApp extends StatelessWidget {
  OsoApp({super.key});

  final GoRouter _router = locator.get<GoRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Oso',

      /// See (https://medium.com/flutter-community/create-a-theme-and-primary-color-switcher-for-your-flutter-app-using-provider-fd334dd7d761)
      /// See (https://github.com/Roaa94/flutter-theme-switcher)
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      builder: (context, widget) {
        var message = '';
        // Widget errorWidget = const Text('...rendering error...');
        if (widget is Scaffold || widget is Navigator) {
          // errorWidget = StatusView(parameter: param);
        }
        ErrorWidget.builder = (errorDetails) {
          message = errorDetails.exception.toString();
          return Text(message);
        };
        if (widget != null) {
          return widget;
        }
        throw StateError('widget is null');
      },
    );
  }
}