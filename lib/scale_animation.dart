import 'package:flutter/material.dart';

class ScaleAnimation extends StatefulWidget {
  const ScaleAnimation({super.key});

  @override
  State<ScaleAnimation> createState() => _ScaleAnimationState();
}

class _ScaleAnimationState extends State<ScaleAnimation>
    with SingleTickerProviderStateMixin {
  late double width = 50;

  late AnimationController _alignAnimationController;

  late Animation<Alignment> _alignAnimation;
  late Animation<Alignment> _alignAnimation2;

  final alignTween =
      Tween<Alignment>(begin: Alignment.topLeft, end: Alignment.bottomRight);
      final alignTween2 =
      Tween<Alignment>(begin: Alignment.topRight, end: Alignment.bottomLeft);

  @override
  void initState() {
    super.initState();

    _alignAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _alignAnimationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _alignAnimationController.stop();
        }
      });

    _alignAnimation = alignTween.animate(_alignAnimationController);
    _alignAnimation2 = alignTween2.animate(_alignAnimationController);

    setState(() {
      _alignAnimationController.forward();
    });
  }

  @override
  void dispose() {
    _alignAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AlignTransition(
            alignment: _alignAnimation,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.greenAccent,

              ),
            ),
          ),
          AlignTransition(
            alignment: _alignAnimation2,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.amber,

              ),
            ),
          ),
        ],
      ),
    );
  }
}
