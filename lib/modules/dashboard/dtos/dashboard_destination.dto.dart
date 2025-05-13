import 'package:flutter/cupertino.dart';

class DashboardDestination {
  const DashboardDestination({required this.label, required this.icon});

  final String label;

  final IconData icon;
}

const dashboardDestination = [
  // DashboardDestination(label: 'Feed', icon: CupertinoIcons.news),
  DashboardDestination(label: 'Progress', icon: CupertinoIcons.chart_bar),
  DashboardDestination(label: 'Activity', icon: CupertinoIcons.bolt),
  DashboardDestination(label: 'Profile', icon: CupertinoIcons.person_solid),
];
