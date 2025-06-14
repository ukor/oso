import 'package:flutter/material.dart';

class FillButtonV2 extends StatelessWidget {
  const FillButtonV2({super.key});

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
  bool _isLongPressing = false;

  @override
  void initState() {
    super.initState();
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
              // After completion, reset the animation after a short delay
              // so the button can be pressed again.
              Future.delayed(const Duration(milliseconds: 500), () {
                _animationController.reset();
                _isLongPressing = false; // Reset the pressing state
              });
            }
          });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onLongPressStart(LongPressStartDetails details) {
    print('Long Press Started');
    _isLongPressing = true;
    _animationController.forward();
  }

  void _onLongPressEnd(LongPressEndDetails details) {
    print('Long Press Ended');
    _isLongPressing = false;
    // If the animation hasn't completed, stop it and reset
    if (_animationController.status != AnimationStatus.completed) {
      _animationController.stop();
      _animationController.reset();
    }
  }

  void _onLongPressCancel() {
    print('Long Press Cancelled');
    _isLongPressing = false;
    // If the animation hasn't completed, stop it and reset
    if (_animationController.status != AnimationStatus.completed) {
      _animationController.stop();
      _animationController.reset();
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
            Clip.antiAlias, // Ensures the fill doesn't overflow rounded corners
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
                      borderRadius: BorderRadius.circular(
                        12.0,
                      ), // Match parent's rounded corners
                    ),
                  ),
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
