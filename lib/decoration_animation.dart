import 'package:flutter/material.dart';

class DecorationAnimation extends StatefulWidget {
  const DecorationAnimation({super.key});

  @override
  State<DecorationAnimation> createState() => _DecorationAnimationState();
}

class _DecorationAnimationState extends State<DecorationAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Decoration> _animation;

  final DecorationTween decorationTween = DecorationTween(
    begin: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      // color: Colors.amber,
      gradient: LinearGradient(colors: [
        Colors.pink,
        Colors.greenAccent,
        Colors.purple,
        // Colors.teal,
        // Colors.deepOrange,
      ], stops: [
        0.2,
        0.1,
        0.4
      ]),
    ),
    end: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      // color: Colors.greenAccent,
      gradient: LinearGradient(colors: [
        Colors.red,
        Colors.green,
        Colors.blue,
      ], stops: [
        0.2,
        0.1,
        0.4
      ]),
      boxShadow: [
        BoxShadow(
            color: Colors.grey.shade600,
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(4, 4)),
        const BoxShadow(
            color: Colors.white,
            blurRadius: 10,
            spreadRadius: 1,
            offset: Offset(-4, -4)),
      ],
    ),
  );
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            _animationController.reverse();
          } else if (status == AnimationStatus.dismissed) {
            _animationController.forward();
          }
        },
      );
    _animation = decorationTween.animate(_animationController);

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: DecoratedBoxTransition(
              position: DecorationPosition.background,
              decoration: _animation,
              child: Container(
                width: 200,
                height: 200,
                // color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
