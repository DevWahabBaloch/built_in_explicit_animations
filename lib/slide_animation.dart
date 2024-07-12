import 'package:flutter/material.dart';

class SlideAnimation extends StatefulWidget {
  const SlideAnimation({super.key});

  @override
  State<SlideAnimation> createState() => _SlideAnimationState();
}

class _SlideAnimationState extends State<SlideAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;
  final tween = Tween<Offset>(begin: Offset(-2,-2), end: Offset(2,2));
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      });
    _animation = tween.animate(_animationController);
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SlideTransition(
            position: _animation,
            child: Container(
              width: 200,
              height: 200,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
