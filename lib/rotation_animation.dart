import 'package:flutter/material.dart';

class RotationAnimation extends StatefulWidget {
  const RotationAnimation({super.key});

  @override
  State<RotationAnimation> createState() => _RotationAnimationState();
}

class _RotationAnimationState extends State<RotationAnimation>
    with SingleTickerProviderStateMixin {
  double width = 50;
  late AnimationController animationController;
  late Animation<double> animation;
  final rotateTween = Tween<double>(begin: 0.0, end: 2.0);

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animationController.forward();
        }
      });
    animation = rotateTween.animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );
    setState(() {
      width = width == 50 ? 200 : 50;
    });
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          RotationTransition(
            turns: animation,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  animationController.stop(canceled: true);

                },
                onDoubleTap: () {
                  animationController.repeat();
                },
                child: Image.asset(
                  'assets/wheel.png',
                  height: 350,
                ),
              ),
            ),
          ),
          Center(
            child: Image.asset(
              'assets/arrow.png',
              height: 70,
            ),
          ),
        ],
      ),
    );
  }
}
