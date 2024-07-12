import 'package:built_in_explicit_animations/shattered_animation.dart';
import 'package:built_in_explicit_animations/slide_animation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExplicitAnimation(),
    );
  }
}

class ExplicitAnimation extends StatefulWidget {
  const ExplicitAnimation({super.key});

  @override
  State<ExplicitAnimation> createState() => _ExplicitAnimationState();
}

class _ExplicitAnimationState extends State<ExplicitAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          'Explicit Animation',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: ShatteredAnimation(),
      ),
    );
  }
}
