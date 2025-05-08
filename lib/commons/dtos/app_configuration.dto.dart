import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:flutter/services.dart';

enum ENVIRONMENTS { development, staging, production }

class Endpoint {
  final String api;

  final String socket;

  Endpoint({required this.api, required this.socket});

  factory Endpoint.fromJson(Map<String, dynamic> json) {
    return Endpoint(api: json['api'], socket: json['socket']);
  }
}

class AppConfiguration {
  final String name;

  final String appTitle;

  final Endpoint endpoint;
  final String zAndroidKey;
  final String zIOSKey;

  AppConfiguration({
    required this.name,
    required this.endpoint,
    required this.appTitle,
    required this.zAndroidKey,
    required this.zIOSKey,
  });

  factory AppConfiguration.fromJson(Map<String, dynamic> json) {
    return AppConfiguration(
      name: json['name'],
      appTitle: json['appTitle'],
      endpoint: Endpoint.fromJson(json['endpoint']),
      zAndroidKey: json['zAndroidKey'] ?? '',
      zIOSKey: json['zIOSKey'] ?? '',
    );
  }

  static Future<AppConfiguration> forEnvironment(String env) async {
    // set default to dev if env is not found
    final String environment =
        [
          'development',
          'production',
          'staging',
        ].firstWhereOrNull((item) => item == env) ??
        'staging';

    // load the json file
    final contents = await rootBundle.loadString(
      'assets/configs/$environment.json',
    );

    // decode our json
    final json = jsonDecode(contents);

    // convert our JSON into an instance of our AppConfig class
    return AppConfiguration.fromJson(json);
  }
}
