import 'dart:async';
import 'dart:io';

import 'package:geolocator/geolocator.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

class LocationService {
  final _log = Logger();

  late double latitude;
  late double longitude;

  String? currentAddress;

  bool isLocationEnabled = false;

  getLastKnowLocation() async {
    await Geolocator.getLastKnownPosition(forceAndroidLocationManager: true);
  }

  LocationSettings _locationSettings() {
    if (Platform.isAndroid) {
      return AndroidSettings(
        accuracy: LocationAccuracy.high,
        // distanceFilter: 100,
        forceLocationManager: true,
        intervalDuration: const Duration(seconds: 5),
        //(Optional) Set foreground notification config to keep the app alive
        //when going to the background
        foregroundNotificationConfig: const ForegroundNotificationConfig(
          notificationText:
              "Oso will continue to receive your location even when you aren't using it",
          notificationTitle: "Oso is running",
          enableWakeLock: true,
        ),
      );
    }

    return AppleSettings(
      accuracy: LocationAccuracy.high,
      activityType: ActivityType.fitness,
      // distanceFilter: 100,
      pauseLocationUpdatesAutomatically: false,
      // Only set to true if our app will be started up in the background.
      showBackgroundLocationIndicator: true,
      allowBackgroundLocationUpdates: true,
    );
  }

  Future<Position?> getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: _locationSettings(),
      );

      return position;
    } catch (e) {
      final position = await Geolocator.getLastKnownPosition();

      return position;
    }
  }

  Stream<ServiceStatus> getLocationPermissionStatusContinuously() {
    Stream<ServiceStatus> statusStream = Geolocator.getServiceStatusStream();

    return statusStream;
  }

  ///
  /// Improved from my original idea without rxDart
  /// Stream<Position>? positionStream;
  ///
  ///     final statusSubscription = statusStream.listen((ServiceStatus v) {
  ///       if (v == ServiceStatus.enabled && positionStream == null) {
  ///         positionStream = Geolocator.getPositionStream(
  ///           locationSettings: _locationSettings(),
  ///         );
  ///       } else if (v == ServiceStatus.disabled && positionStream != null) {
  ///         positionStream = null;
  ///       }
  ///     });
  ///
  Stream<Position> getLocationContinuously() {
    final controller = StreamController<Position>.broadcast();
    StreamSubscription<ServiceStatus>? statusSubscription;
    StreamSubscription<Position>? positionSubscription;
    bool isDisposed = false;

    void startPositionStream() {
      if (isDisposed) return; // Don't start if already disposed
      positionSubscription = Geolocator.getPositionStream(
        locationSettings: _locationSettings(),
      ).listen(
        (position) {
          if (!controller.isClosed) {
            controller.add(position);
          }
        },
        onError: (error) {
          if (!controller.isClosed) {
            controller.addError(error);
          }
        },
        onDone: () {
          if (!controller.isClosed) {
            //  controller.close(); // Don't close here, status stream controls this.
          }
        },
      );
    }

    void stopPositionStream() {
      positionSubscription?.cancel();
      positionSubscription = null;
    }

    // Listen to service status changes.
    statusSubscription = Geolocator.getServiceStatusStream().listen(
      (status) {
        if (isDisposed) return; // Don't react if disposed
        if (status == ServiceStatus.enabled) {
          startPositionStream();
        } else {
          stopPositionStream();

          if (!controller.isClosed) {
            controller.addError(StateError('Location service is disabled.'));
          }
        }
      },
      onError: (error) {
        if (!controller.isClosed) {
          controller.addError(error);
        }
      },
      onDone: () {
        if (!controller.isClosed) {
          controller.close();
        }
      },
    );

    // Check the initial service status.  Crucial!
    Geolocator.isLocationServiceEnabled()
        .then((enabled) {
          if (isDisposed) return; // Don't react if disposed
          if (enabled) {
            startPositionStream();
          } else {
            stopPositionStream();
            if (!controller.isClosed) {
              controller.addError(
                StateError('Location service is initially disabled.'),
              );
            }
          }
        })
        .catchError((error) {
          if (!controller.isClosed) {
            controller.addError(error);
          }
        });

    // Ensure proper cleanup.  Use controller.close()
    controller.onCancel = () {
      isDisposed = true;
      statusSubscription?.cancel();
      stopPositionStream();
      // controller.close();  // Close only once.  Moved to statusStream onDone and initial check
    };

    return controller.stream;
  }

  Stream<Position> getLocationContinuouslyV2() {
    Stream<ServiceStatus> statusStream =
        Geolocator.getServiceStatusStream().distinct();

    return statusStream.switchMap((ServiceStatus status) {
      if (status == ServiceStatus.enabled) {
        return Geolocator.getPositionStream(
          locationSettings: _locationSettings(),
        ).handleError((error, stackTrace) {
          _log.f(error, stackTrace: stackTrace);
          return const Stream.empty();
        });
      } else {
        return const Stream.empty();
      }
    });
  }
}
