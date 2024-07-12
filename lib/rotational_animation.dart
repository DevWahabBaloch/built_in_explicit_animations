import 'package:flutter/material.dart';

class RotationAnimations extends StatefulWidget {
  const RotationAnimations({super.key});

  @override
  State<RotationAnimations> createState() => _RotationAnimationsState();
}

class _RotationAnimationsState extends State<RotationAnimations>
    with SingleTickerProviderStateMixin {
  double width = 50;
  late Animation<double> _animation;
  late AnimationController _controller;
  final tween = Tween<double>(begin: 0.0, end: 1.0);
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.repeat();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }

        _animation = tween.animate(_controller);
      });
    setState(() {
      width = width == 50 ? 200 : 50;
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
        
            RotationTransition(
              turns: _animation,
              child: Image.asset(
                'assets/s2.png',
                height: 300,
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
