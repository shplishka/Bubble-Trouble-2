import 'package:flutter/material.dart';

class MyBall extends StatelessWidget {
  final double bX;
  final double bY;

  const MyBall({required this.bX, required this.bY});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(bX, bY),
      child: Image.asset(
        'lib/images/leaf.png',
        width: 40,
        height: 40,
        fit: BoxFit.contain,
      ),
    );
  }
}
