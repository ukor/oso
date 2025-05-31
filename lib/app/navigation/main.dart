import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:oso/modules/_example/views/example.view.dart';
import 'package:oso/modules/activity/views/activity.view.dart';
import 'package:oso/modules/activity/views/ongoing_activity.view.dart';
import 'package:oso/modules/activity/views/start_activity.view.dart';
import 'package:oso/modules/dashboard/views/dashboard.view.dart';
import 'package:oso/modules/profile/views/profile.view.dart';
import 'package:oso/modules/progress/views/progress.view.dart';

final log = Logger();

GoRouter router() {
  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: ActivityScreen.route.path,
    observers: [],
    redirect: (BuildContext context, GoRouterState state) async {
      log.d(
        "path name -> ${state.name} - path route -> ${state.path} --> full path ${state.fullPath}",
      );

      return null;
    },
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, StatefulNavigationShell navigationShell) {
          return DashboardScaffold(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: ProgressScreen.route.path,
                name: ProgressScreen.route.name,
                builder: (context, state) {
                  return ProgressScreen();
                },
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: ActivityScreen.route.path,
                name: ActivityScreen.route.name,
                builder: (context, state) {
                  return ActivityScreen();
                },
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: ProfileScreen.route.path,
                name: ProfileScreen.route.name,
                builder: (context, state) {
                  return ProfileScreen();
                },
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: StartActivityScreen.route.path,
        name: StartActivityScreen.route.name,
        builder: (context, state) {
          return const StartActivityScreen();
        },
      ),
      // OngoingActivity
      GoRoute(
        path: OngoingActivityScreen.route.path,
        name: OngoingActivityScreen.route.name,
        builder: (context, state) {
          return const OngoingActivityScreen();
        },
      ),
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
