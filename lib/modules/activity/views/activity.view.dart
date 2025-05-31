import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oso/app/navigation/routes.dart';
import 'package:oso/commons/constants/colors.dart';
import 'package:oso/commons/extensions/build_context.extension.dart';
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
      appBar: AppBar(
        title: Text('\u1ECCs\u1ECD'), // Oso
        centerTitle: true,
      ),
      body: SafeArea(
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
                  "00:00:00",
                  style: context.textTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),

              Center(
                child: Text("Duration", style: context.textTheme.labelSmall),
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

              SizedBox(height: 100),
              Container(
                color: OAppColors.primaryShade4,
                // decoration: BoxDecoration(borderRadius: BoxBorder()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Icon(CupertinoIcons.flame, size: 48),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: '55\u00A0',
                            style: context.textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'weeks',
                                style: context.textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 8),
                        RichText(
                          text: TextSpan(
                            text: '171\u00A0',
                            style: context.textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Activities',
                                style: context.textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 28),

              SizedBox(height: context.heightWithPercent(15)),
              Center(
                child: SizedBox(
                  height: 50,
                  width: 250,
                  child: ElevatedButton(
                    onPressed: _state.onStart,
                    child: Text('Start'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
