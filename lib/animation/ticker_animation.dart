import 'package:flutter/material.dart';

class TickerExample extends StatefulWidget {
  const TickerExample({Key? key}) : super(key: key);

  @override
  _TickerExampleState createState() => _TickerExampleState();
}
// ...

class _TickerExampleState extends State<TickerExample>
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

    // (2): add listener to the controller
    // to rebuild the view
    controller.addListener(() {
      setState(() {});
    });
    // (3): start the animation
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 100,
          width: controller.value,
          color: Colors.blue,
        ),
      ),
    );
  }
}
