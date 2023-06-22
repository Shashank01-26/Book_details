import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class customCardPaint extends CustomPainter {
  final double radius;
  final Color startColor;
  final Color endColor;

  customCardPaint(this.radius, this.startColor, this.endColor);
  @override
  void paint(Canvas canvas, Size size) {
    var radius = 24.0;

    var paint = Paint();
    paint.shader =
        ui.Gradient.linear(Offset(0, 0), Offset(size.width, size.height), [
      HSLColor.fromColor(startColor).withLightness(0.7).toColor(),
      HSLColor.fromColor(endColor).withLightness(0.8).toColor()
    ]);

    var path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width - radius, size.height)
      ..quadraticBezierTo(
          size.width, size.height, size.width, size.height -0.1* radius)
      ..lineTo(size.width, radius-17)
      ..quadraticBezierTo(size.width, 0, size.width - 0.7*radius, 0)
      ..lineTo(size.width - 0.9 * radius,0)
      ..quadraticBezierTo(-radius, 1.5 * radius, 2, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(customCardPaint oldDelegate) {
    return true;
  }
}
