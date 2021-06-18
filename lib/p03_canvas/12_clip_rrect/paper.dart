import 'package:flutter/material.dart';
import 'package:flutter_draw/coordinate.dart';
import 'dart:ui' as ui;

class Paper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomPaint(
        painter: PaperPainter(),
      ),
    );
  }
}

class PaperPainter extends CustomPainter {
  Paint _paint;
  PaperPainter() {
    _paint
      ..style = PaintingStyle.stroke
      ..color = Colors.blue;
  }

  final Coordinate coordinate = Coordinate();
  @override
  void paint(Canvas canvas, Size size) {
    coordinate.paint(canvas, size);
    canvas.translate(size.width / 2, size.height / 2);
    _drawClipRRect(canvas);
  }

  //矩形裁剪
  void _drawClipRRect(Canvas canvas) {
    var rect = Rect.fromCenter(center: Offset.zero, width: 200, height: 100);
    canvas.clipRRect(RRect.fromRectAndRadius(rect, Radius.circular(30)));
    canvas.drawColor(Colors.red, BlendMode.darken);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
