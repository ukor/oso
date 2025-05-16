import 'package:flutter/material.dart';
import 'package:oso/app/navigation/routes.dart';
import 'package:oso/modules/activity/stores/activity.state.dart';

class ActivityScreen extends StatefulWidget {
  static final route = AppRoute.fromName(
    rName: 'activity',
    requiresAuth: false,
  );

  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  final _state = ActivityState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Activity')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [],
          ),
        ),
      ),
    );
  }
}
