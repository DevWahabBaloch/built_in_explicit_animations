import 'dart:math';

import 'package:flutter/material.dart';

class ShatteredAnimation extends StatefulWidget {
  const ShatteredAnimation({super.key});

  @override
  State<ShatteredAnimation> createState() => _ShatteredAnimationState();
}

class _ShatteredAnimationState extends State<ShatteredAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _RotationAnimation;
  late Animation<Offset> _slideAnimation;
  final rotationTween = Tween<double>(begin: 0.0, end: 2 * pi);
  final slideTween = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0, 1),
  );

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.repeat();
        }
      });
    _RotationAnimation = rotationTween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.2, 2.0),
      ),
    );
    _animationController.forward();

    _slideAnimation = slideTween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(2.5, 5.0),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Stack(
        children: [
          SlideTransition(
            position: _slideAnimation,
            child: RotationTransition(
              turns: _RotationAnimation,
              child: Container(
                height: height * 0.5,
                width: width * 0.5,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xff090088),
                    Colors.amber,
                    Color(0xff090088),
                    Colors.amber,
                    Color(0xff090088),
                  ]),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
