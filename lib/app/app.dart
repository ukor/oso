import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oso/app/service_locators/main.dart';
import 'package:oso/app/theme/theme.dart';

class OsoApp extends StatelessWidget {
  OsoApp({super.key});

  final GoRouter _router = locator.get<GoRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Oso',

      theme: OAppTheme.lightTheme,
      darkTheme: OAppTheme.darkTheme,
      themeMode: ThemeMode.light,
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
