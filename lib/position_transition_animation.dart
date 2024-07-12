import 'package:flutter/material.dart';

class PositionTransitionAnimation extends StatefulWidget {
  const PositionTransitionAnimation({super.key});

  @override
  State<PositionTransitionAnimation> createState() =>
      _PositionTransitionAnimationState();
}

class _PositionTransitionAnimationState
    extends State<PositionTransitionAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<RelativeRect> _animation;
  final tween = RelativeRectTween(
    begin: RelativeRect.fromSize(
      Rect.fromLTWH(100, 100, 200, 200),
      Size(2, 2),
    ),
    end: RelativeRect.fromSize(
      Rect.fromLTWH(0, 0, 100, 100),
      Size(2, 2),
    ),
  );
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            _animationController.reverse();
          } else if (status == AnimationStatus.dismissed) {
            _animationController.forward();
          }
        },
      );
    _animation = tween.animate(_animationController);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PositionedTransition(
            rect: _animation,
            child: Text(
              'Wahab Baloch',
              style: TextStyle(
                color: Colors.greenAccent,
                fontSize: 50,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
