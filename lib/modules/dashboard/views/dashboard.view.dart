import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oso/app/navigation/routes.dart';
import 'package:oso/commons/constants/colors.dart';
import 'package:oso/modules/dashboard/dtos/dashboard_destination.dto.dart';

class DashboardScaffold extends StatelessWidget {
  const DashboardScaffold({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: navigationShell.goBranch,
        indicatorColor: Theme.of(context).indicatorColor,
        destinations:
            dashboardDestination.map((destination) {
              return NavigationDestination(
                icon: Icon(destination.icon),
                label: destination.label,
                selectedIcon: Icon(
                  destination.icon,
                  color: OAppColors.secondaryColor,
                ),
              );
            }).toList(),
      ),
    );
  }
}
