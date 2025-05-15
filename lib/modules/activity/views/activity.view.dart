import 'package:flutter/material.dart';
import 'package:oso/app/navigation/routes.dart';
import 'package:oso/commons/extensions/build_context.extension.dart';

class ActivityScreen extends StatelessWidget {
  static final route = AppRoute.fromName(
    rName: 'activity',
    requiresAuth: false,
  );

  const ActivityScreen({super.key});

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
