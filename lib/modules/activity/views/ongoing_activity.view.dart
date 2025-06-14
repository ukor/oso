import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:oso/app/navigation/routes.dart';
import 'package:oso/commons/extensions/build_context.extension.dart';
import 'package:oso/modules/activity/stores/ongoing_activity.state.dart';

class OngoingActivityScreen extends StatefulWidget {
  static final route = AppRoute.fromName(
    rName: 'ongoing-activity',
    requiresAuth: false,
  );

  const OngoingActivityScreen({super.key});

  @override
  State<OngoingActivityScreen> createState() => _OngoingActivityScreenState();
}

class _OngoingActivityScreenState extends State<OngoingActivityScreen> {
  final _state = OngoingActivityState();

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
      appBar: AppBar(
        title: Text('\u1ECCs\u1ECD'), // Oso
        centerTitle: true,
      ),
      body: Observer(
        builder: (context) {
          return SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text('GPS', textAlign: TextAlign.right),
                  ),

                  SizedBox(height: 8),
                  Center(
                    child: Text(
                      "${_state.hours.toString().padLeft(2, '0')}:${_state.minutes.toString().padLeft(2, '0')}:${_state.seconds.toString().padLeft(2, '0')}",
                      style: context.textTheme.displayLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),

                  Center(
                    child: Text(
                      "Duration",
                      style: context.textTheme.labelSmall,
                    ),
                  ),

                  SizedBox(height: 28),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Center(
                            child: Text(
                              "0.00",
                              style: context.textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              "Distance(KM)",
                              style: context.textTheme.labelSmall,
                            ),
                          ),
                        ],
                      ),

                      Column(
                        children: [
                          Center(
                            child: Text(
                              "0",
                              style: context.textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              "Calories(cal)",
                              style: context.textTheme.labelSmall,
                            ),
                          ),
                        ],
                      ),

                      Column(
                        children: [
                          Center(
                            child: Text(
                              "00:00",
                              style: context.textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              "Avg. Pace(min/km)",
                              style: context.textTheme.labelSmall,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: context.heightWithPercent(15)),
                  Text(_state.coordinate),

                  SizedBox(
                    height: 46,
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        final item = _state.positions[index];
                        return Observer(
                          builder: (context) {
                            return ListTile(
                              leading: Icon(CupertinoIcons.location_solid),
                              subtitle: Text(item.toString()),
                            );
                          },
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(height: 1, thickness: 1);
                      },
                      itemCount: _state.positions.length,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 36),
        child: SizedBox(
          height: 60,
          // width: 250,
          child: InkWell(
            onTapDown: (td) {
              print('tap down');
              _state.onDone();
            },
            onTapCancel: () {
              print('tap cancel');
            },
            child: ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Text('Unlock'), Icon(CupertinoIcons.lock)],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
