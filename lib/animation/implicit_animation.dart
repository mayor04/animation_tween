import 'package:flutter/material.dart';

class ImplicitExample extends StatefulWidget {
  const ImplicitExample({Key? key}) : super(key: key);

  @override
  _ImplicitExampleState createState() => _ImplicitExampleState();
}
// ...

class _ImplicitExampleState extends State<ImplicitExample> {
  double width = 70;
  Color color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            width = 300;
            color = Colors.red;
            setState(() {});
          },
          child: AnimatedContainer(
            height: 100,
            width: width,
            color: color,
            duration: const Duration(seconds: 2),
          ),
        ),
      ),
    );
  }
}
