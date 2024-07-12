import 'package:flutter/material.dart';

class SizeAnimation extends StatefulWidget {
  const SizeAnimation({super.key});

  @override
  State<SizeAnimation> createState() => _SizeAnimationState();
}

class _SizeAnimationState extends State<SizeAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final tween = Tween<double>(begin: 0 , end: 1);
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 5))..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.repeat();
      }
    });
    _animation = tween.animate(_controller);
    _controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizeTransition(sizeFactor: _animation , child: Center(
            child: Container(
              width: 200,
              height: 200,
              color: Colors.red,
            ),
          ),)
        ],
      ),
    );
  }
}