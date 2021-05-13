import 'dart:math' as math;

import 'package:flutter/material.dart';

class Arc extends StatelessWidget {
  final double diameter;
  final Color borderColor;

  const Arc({Key? key, this.diameter = 200, this.borderColor = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyPainter(borderColor),
      size: Size(diameter, diameter),
    );
  }
}

// This is the Painter class
class MyPainter extends CustomPainter {
  final Color borderColor;

  MyPainter(this.borderColor);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.height / 2, size.width / 2),
        height: size.height,
        width: size.width,
      ),
      math.pi,
      math.pi,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
