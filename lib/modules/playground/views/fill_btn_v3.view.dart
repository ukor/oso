import 'dart:math' as math;

import 'package:flutter/material.dart';

class FillWithWave extends StatelessWidget {
  const FillWithWave({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Long Press Button Demo')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: LongPressProgressBarButton(
            text: 'Press and Hold for 5 Seconds',
            onCompleted: () {
              // Action to perform when the long press completes
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Long press completed!'),
                  duration: Duration(seconds: 2),
                ),
              );
              print('Long press completed!');
            },
          ),
        ),
      ),
    );
  }
}

class LongPressProgressBarButton extends StatefulWidget {
  final String text;
  final VoidCallback onCompleted;
  final Color baseColor;
  final Color fillColor;
  final Duration longPressDuration;

  const LongPressProgressBarButton({
    super.key,
    required this.text,
    required this.onCompleted,
    this.baseColor = Colors.white,
    this.fillColor = Colors.blue,
    this.longPressDuration = const Duration(seconds: 5),
  });

  @override
  State<LongPressProgressBarButton> createState() =>
      _LongPressProgressBarButtonState();
}

class _LongPressProgressBarButtonState extends State<LongPressProgressBarButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late AnimationController
  _waveAnimationController; // Controller for wave movement
  late Animation<double> _waveAnimation; // Animation for wave offset
  bool _isLongPressing = false;

  @override
  void initState() {
    super.initState();
    // Main progress animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: widget.longPressDuration,
    );

    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController)
          ..addListener(() {
            // Rebuild the widget as the animation value changes
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              // If animation completes, trigger the onCompleted callback
              if (_isLongPressing) {
                // Ensure it completed while still pressing
                widget.onCompleted();
              }
              // IMMEDIATELY STOP AND RESET BOTH ANIMATIONS
              _animationController.reset();
              _waveAnimationController.stop(); // Stop wave animation
              _waveAnimationController.reset(); // Reset wave position
              _isLongPressing = false; // Reset the pressing state
            }
          });

    // Wave animation controller (for continuous wave movement)
    _waveAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Speed of the wave movement
    );

    _waveAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_waveAnimationController)..addListener(() {
      // Only rebuild if the wave animation controller itself is animating.
      // This ensures setState is not called when the wave animation is stopped/reset.
      if (_waveAnimationController.isAnimating) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _waveAnimationController.dispose(); // Dispose the wave controller
    super.dispose();
  }

  void _onLongPressStart(LongPressStartDetails details) {
    print('Long Press Started');
    _isLongPressing = true;
    _animationController.forward(); // Start main progress animation
    _waveAnimationController.repeat(); // Start wave animation repeating
  }

  void _onLongPressEnd(LongPressEndDetails details) {
    print('Long Press Ended');
    _isLongPressing = false;
    // If the animation hasn't completed, stop it and reset both
    if (_animationController.status != AnimationStatus.completed) {
      _animationController.stop();
      _animationController.reset();
      _waveAnimationController.stop(); // Stop wave animation
      _waveAnimationController.reset(); // Reset wave position
    }
  }

  void _onLongPressCancel() {
    print('Long Press Cancelled');
    _isLongPressing = false;
    // If the animation hasn't completed, stop it and reset both
    if (_animationController.status != AnimationStatus.completed) {
      _animationController.stop();
      _animationController.reset();
      _waveAnimationController.stop(); // Stop wave animation
      _waveAnimationController.reset(); // Reset wave position
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: _onLongPressStart,
      onLongPressEnd: _onLongPressEnd,
      onLongPressCancel: _onLongPressCancel,
      child: Container(
        width: 300, // Fixed width for demonstration
        height: 60, // Fixed height for demonstration
        decoration: BoxDecoration(
          color: widget.baseColor,
          borderRadius: BorderRadius.circular(12.0), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // Shadow for depth
            ),
          ],
        ),
        clipBehavior:
            Clip.antiAlias, // Ensures the fill and wave don't overflow rounded corners
        child: Stack(
          children: [
            // Progress Bar Fill
            Positioned.fill(
              child: Align(
                alignment: Alignment.centerLeft,
                child: FractionallySizedBox(
                  widthFactor:
                      _animation.value, // Animate width based on progress
                  child: Container(
                    decoration: BoxDecoration(
                      color: widget.fillColor,
                      // The wave painter will draw the rounded corners
                    ),
                  ),
                ),
              ),
            ),
            // Wave Animation (on top of the fill)
            Positioned.fill(
              child: CustomPaint(
                painter: WavePainter(
                  progress: _animation.value,
                  waveOffset: _waveAnimation.value,
                  waveColor: widget.fillColor.withOpacity(
                    0.9,
                  ), // Slightly transparent wave for depth
                ),
              ),
            ),
            // Button Text
            Center(
              child: Text(
                widget.text,
                style: TextStyle(
                  color:
                      _animation.value > 0.5
                          ? Colors.white
                          : Colors.black87, // Text color changes for contrast
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Painter for drawing the wave effect
class WavePainter extends CustomPainter {
  final double progress; // Current fill progress (0.0 to 1.0)
  final double
  waveOffset; // Horizontal offset for wave (0.0 to 1.0, repeats for continuous movement)
  final Color waveColor;
  final double waveAmplitude; // Max height of the wave
  final double
  waveFrequency; // How many waves across the width (cycles per width)

  WavePainter({
    required this.progress,
    required this.waveOffset,
    required this.waveColor,
    this.waveAmplitude = 5.0, // Smaller amplitude for a subtle wave
    this.waveFrequency = 1.5, // 1.5 waves across the button width
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Only draw the wave if there's progress
    if (progress <= 0) return;

    final paint =
        Paint()
          ..color = waveColor
          ..style = PaintingStyle.fill;

    // Calculate the current filled height from the bottom
    final double filledHeight = size.height * progress;
    // Calculate the base Y position for the wave (top edge of the filled area)
    final double topOfFillY = size.height - filledHeight;

    final path = Path();

    // Start drawing the path from the bottom-left of the button
    path.moveTo(0, size.height);
    // Draw a line up to the starting point of the wave (top left of the filled area)
    path.lineTo(0, topOfFillY);

    // Draw the wave along the top edge of the filled area
    for (double x = 0; x <= size.width; x += 1) {
      // Increment by 1 for smoother curve
      // Calculate y position using a sine wave function
      // (x / size.width * waveFrequency * 2 * math.pi) controls the frequency of the wave across the button's width
      // (waveOffset * 2 * math.pi) controls the horizontal shifting of the wave
      final y =
          topOfFillY +
          waveAmplitude *
              math.sin(
                (x / size.width * waveFrequency * 2 * math.pi) +
                    (waveOffset * 2 * math.pi),
              );
      path.lineTo(x, y);
    }

    // Complete the path by drawing lines down to the bottom-right and then back to bottom-left
    path.lineTo(size.width, size.height);
    path.close(); // Closes the path to form a fillable shape

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant WavePainter oldDelegate) {
    // Repaint only if progress or waveOffset changes
    return oldDelegate.progress != progress ||
        oldDelegate.waveOffset != waveOffset;
  }
}
