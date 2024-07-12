import 'package:flutter/material.dart';

class TextStyleAnimation extends StatefulWidget {
  const TextStyleAnimation({super.key});

  @override
  State<TextStyleAnimation> createState() => _TextStyleAnimationState();
}

class _TextStyleAnimationState extends State<TextStyleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<TextStyle> _animation;
  TextStyleTween tween = TextStyleTween(
    begin: TextStyle(
      color: Colors.amber,
      fontSize: 20,
    ),
    end: TextStyle(
      color: Colors.greenAccent,
      fontSize: 50,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: DefaultTextStyleTransition(style: _animation, child: Text('Wahab Baloch')))
        ],
      ),
    );
  }
}
