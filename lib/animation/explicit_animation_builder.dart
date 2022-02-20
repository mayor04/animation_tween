import 'package:flutter/material.dart';

class ExplicitExample extends StatefulWidget {
  const ExplicitExample({Key? key}) : super(key: key);

  @override
  _ExplicitExampleState createState() => _ExplicitExampleState();
}
// ...

class _ExplicitExampleState extends State<ExplicitExample>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    // (1): initialize the controller
    controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
      lowerBound: 70,
      upperBound: 300,
    );

    // (3): start the animation
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Container(
              height: 100,
              width: controller.value,
              color: Colors.blue,
            );
          },
        ),
      ),
    );
  }
}
