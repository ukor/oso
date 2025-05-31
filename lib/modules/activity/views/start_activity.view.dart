import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:oso/app/navigation/routes.dart';
import 'package:oso/commons/extensions/build_context.extension.dart';
import 'package:oso/modules/activity/stores/start_activity.state.dart';

class StartActivityScreen extends StatefulWidget {
  static final route = AppRoute.fromName(
    rName: 'start-activity',
    requiresAuth: false,
  );

  const StartActivityScreen({super.key});

  @override
  State<StartActivityScreen> createState() => _StartActivityScreenState();
}

class _StartActivityScreenState extends State<StartActivityScreen> {
  final _state = StartActivityState();

  @override
  void initState() {
    _state.init();
    super.initState();
  }

  @override
  void dispose() {
    _state.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (context) {
          return SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "${_state.randomStream.value ?? _state.countdownFrom}",
                    style: context.textTheme.displayLarge?.copyWith(
                      fontWeight: FontWeight.w900,
                      fontSize: 160,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 36),
        child: SizedBox(
          height: 60,
          child: ElevatedButton(
            onPressed: _state.onIncrement,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Text('Add 10'), Icon(CupertinoIcons.plus)],
            ),
          ),
        ),
      ),
    );
  }
}
