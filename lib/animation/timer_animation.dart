import 'dart:async';

import 'package:flutter/material.dart';

class TimerAnimation extends StatefulWidget {
  const TimerAnimation({Key? key}) : super(key: key);

  @override
  State<TimerAnimation> createState() => _TimerAnimationState();
}

class _TimerAnimationState extends State<TimerAnimation> {
  double width = 70;

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        width = width + 4;
      });

      if (width > 300) {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 100,
          width: width,
          color: Colors.blue,
        ),
      ),
    );
  }
}
