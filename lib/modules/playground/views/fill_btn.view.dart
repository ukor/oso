import 'dart:async';

import 'package:flutter/material.dart';

class FillButton extends StatefulWidget {
  const FillButton({super.key});

  @override
  State<FillButton> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<FillButton> {
  double _progress = 0.0;
  Timer? _longPressTimer;
  bool _isPressing = false;

  void _startLongPressProgress() {
    _isPressing = true;
    const duration = Duration(milliseconds: 50); // Update every 50ms
    const totalDuration = Duration(seconds: 5);
    final increments = totalDuration.inMilliseconds / duration.inMilliseconds;
    final incrementValue = 1.0 / increments;

    _longPressTimer = Timer.periodic(duration, (timer) {
      if (_isPressing) {
        setState(() {
          _progress = (_progress + incrementValue).clamp(0.0, 1.0);
        });
        if (_progress >= 1.0) {
          _longPressTimer?.cancel();
          _longPressTimer = null;
          _isPressing = false;

          // Action to perform after 5 seconds of long press
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Button fully pressed!')),
          );
          _resetProgress();
        }
      } else {
        _longPressTimer?.cancel();
        _longPressTimer = null;
        _resetProgress();
      }
    });
  }

  void _stopLongPressProgress() {
    _isPressing = false;
    _longPressTimer?.cancel();
    _longPressTimer = null;
    _resetProgress();
  }

  void _resetProgress() {
    setState(() {
      _progress = 0.0;
    });
  }

  @override
  void dispose() {
    _longPressTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Progress Button')),
      body: Center(
        child: GestureDetector(
          onLongPressStart: (_) {
            _startLongPressProgress();
          },
          onLongPressEnd: (_) {
            _stopLongPressProgress();
          },
          onTapUp: (_) {
            // If it was a tap, stop any progress that might have just started
            _stopLongPressProgress();
          },
          child: Container(
            width: 200,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey[300]!),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Stack(
              children: [
                // Progress fill
                Align(
                  alignment: Alignment.centerLeft,
                  child: AnimatedContainer(
                    duration: const Duration(
                      milliseconds: 50,
                    ), // Smooth transition for progress
                    width: 200 * _progress,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(
                        0.5,
                      ), // Color of the progress fill
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                // Button content (text)
                const Center(
                  child: Text(
                    'Long Press Me',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
