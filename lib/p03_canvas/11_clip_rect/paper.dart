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
  final Coordinate coordinate = Coordinate();
  Paint _paint;
  PaperPainter() {
    _paint = Paint()..color = Colors.blue;
  }
  @override
  void paint(Canvas canvas, Size size) {
    coordinate.paint(canvas, size);
    canvas.translate(size.width / 2, size.height / 2);
    _drawClipRect(canvas);
  }

  //矩形裁剪
  void _drawClipRect(Canvas canvas) {
    var rect = Rect.fromCenter(center: Offset.zero, width: 200, height: 200);
    canvas.clipRect(rect,
        doAntiAlias: true, clipOp: ui.ClipOp.intersect); //裁剪画布
    var colors = [
      Color(0xFFF60C0C),
      Color(0xFFF3B913),
      Color(0xFFE7F716),
      Color(0xFF3DF30B),
      Color(0xFF0DF6EF),
      Color(0xFF0829FB),
      Color(0xFFB709F4),
    ];
    var pos = [1.0 / 7, 2.0 / 7, 3.0 / 7, 4.0 / 7, 5.0 / 7, 6.0 / 7, 1.0];
    _paint.shader = ui.Gradient.linear(
        rect.centerLeft, rect.centerRight, colors, pos, TileMode.clamp);
    _paint.blendMode = BlendMode.lighten;
    canvas.drawPaint(_paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
