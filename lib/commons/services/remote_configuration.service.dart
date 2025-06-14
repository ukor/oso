import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

class RemoteConfiguration {
  final FirebaseRemoteConfig remoteConfig;

  RemoteConfiguration._(this.remoteConfig);

  static Future<RemoteConfiguration> initialize() async {
    final remoteConfigInstance = FirebaseRemoteConfig.instance;

    await remoteConfigInstance.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(hours: 24),
      ),
    );

    try {
      await remoteConfigInstance.fetchAndActivate();
    } catch (e) {
      debugPrint('Error fetching remote config: $e');
      // Handle error appropriately, e.g., log to crashlytics, use default values
    }

    return RemoteConfiguration._(remoteConfigInstance);
  }
}
