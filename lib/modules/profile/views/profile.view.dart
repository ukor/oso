import 'package:flutter/material.dart';
import 'package:oso/app/navigation/routes.dart';

class ProfileScreen extends StatelessWidget {
  static final route = AppRoute.fromName(rName: 'profile', requiresAuth: false);

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
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
