import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oso/commons/constants/colors.dart';
import 'package:oso/modules/dashboard/dtos/dashboard_destination.dto.dart';
import 'package:oso/modules/dashboard/stores/dashboard.state.dart';

class DashboardScaffold extends StatefulWidget {
  const DashboardScaffold({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<DashboardScaffold> createState() => _DashboardScaffoldState();
}

class _DashboardScaffoldState extends State<DashboardScaffold> {
  final _state = DashboardState();

  @override
  void initState() {
    _state.init();
    print('he');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: BottomNavigationBarTheme(
        data: Theme.of(context).bottomNavigationBarTheme,
        child: NavigationBar(
          selectedIndex: widget.navigationShell.currentIndex,
          onDestinationSelected: widget.navigationShell.goBranch,
          indicatorColor: OAppColors.primaryColor,
          surfaceTintColor: OAppColors.primaryColor,
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
      ),
    );
  }
}
