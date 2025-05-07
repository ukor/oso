import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:oso/modules/_example/views/example.view.dart';

final log = Logger();

GoRouter router() {
  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: ExampleScreen.route.path,
    observers: [],
    redirect: (BuildContext context, GoRouterState state) async {
      log.d(
        "path name -> ${state.name} - path route -> ${state.path} --> full path ${state.fullPath}",
      );

      return null;
    },
    routes: [
      GoRoute(
        path: ExampleScreen.route.path,
        name: ExampleScreen.route.name,
        builder: (context, state) {
          return const ExampleScreen();
        },
      ),
    ],
    errorPageBuilder: (BuildContext context, GoRouterState state) {
      return MaterialPage(
        key: state.pageKey,
        child: Text(state.error?.message ?? ''),
      );
    },
  );
}
