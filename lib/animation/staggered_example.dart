import 'dart:math';

import 'package:flutter/material.dart';

class StaggeredExample extends StatefulWidget {
  const StaggeredExample({Key? key}) : super(key: key);

  @override
  _StaggeredExampleState createState() => _StaggeredExampleState();
}

class _StaggeredExampleState extends State<StaggeredExample>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<Color?> buttonColorAnimation;
  late Animation<Color?> iconColorAnimation;
  late Animation<double?> rotateAnimation;
  late Animation<double?> scaleAnimation;
  late Animation<double?> iconPopUpAnimation;

  bool isForward = false;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    ColorTween tween = ColorTween(begin: Colors.white, end: Colors.blue);
    tween.animate(controller);

    buttonColorAnimation =
        ColorTween(begin: Colors.white, end: Colors.blue).animate(controller);

    iconColorAnimation = ColorTween(begin: Colors.black87, end: Colors.white)
        .animate(controller);

    rotateAnimation = Tween<double>(begin: 0, end: 180).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOut,
      ),
    );

    scaleAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: controller,
      curve: const Interval(0.1, 0.7, curve: Curves.easeOutCubic),
    ));

    iconPopUpAnimation =
        Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: controller,
      curve: const Interval(0.5, 1, curve: Curves.elasticOut),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Transform.scale(
                  scale: scaleAnimation.value ?? 0,
                  alignment: Alignment.bottomCenter,
                  child: ThreeIconBox(
                    iconOffset: iconPopUpAnimation.value,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    if (isForward) {
                      reverseAnimation();
                    } else {
                      forwardAnimation();
                    }
                  },
                  child: Transform.rotate(
                    angle: convertAngle(rotateAnimation.value),
                    child: CirclularIconButton(
                      buttonColor: buttonColorAnimation.value,
                      iconColor: iconColorAnimation.value,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  double convertAngle(double? angle) {
    return (angle ?? 0) * pi / 180;
  }

  forwardAnimation() {
    isForward = true;
    controller.forward();
  }

  reverseAnimation() {
    isForward = false;
    controller.reverse();
  }
}

class CirclularIconButton extends StatelessWidget {
  final Color? buttonColor;
  final Color? iconColor;

  const CirclularIconButton({
    Key? key,
    required this.buttonColor,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 3),
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
          ),
        ],
      ),
      child: Icon(
        Icons.arrow_upward,
        color: iconColor,
      ),
    );
  }
}

class ThreeIconBox extends StatelessWidget {
  final double? iconOffset;
  const ThreeIconBox({
    Key? key,
    required this.iconOffset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 3),
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Transform.scale(
              scale: iconOffset ?? 1,
              child: const Icon(
                Icons.home_outlined,
                color: Colors.blueGrey,
              ),
            ),
          ),
          Expanded(
            child: Transform.scale(
              scale: iconOffset ?? 1,
              child: const Icon(
                Icons.person_outline,
                color: Colors.blueGrey,
              ),
            ),
          ),
          Expanded(
            child: Transform.scale(
              scale: iconOffset ?? 1,
              child: const Icon(
                Icons.search,
                color: Colors.blueGrey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
