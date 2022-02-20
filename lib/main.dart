import 'package:animation_tween/animation/implicit_animation.dart';
import 'package:animation_tween/animation/color_example.dart';
import 'package:animation_tween/animation/staggered_example.dart';
import 'package:animation_tween/animation/ticker_animation.dart';
import 'package:animation_tween/animation/timer_animation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ColorAnimationExample(),
    );
  }
}
