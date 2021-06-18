import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_draw/coordinate.dart';

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
    _paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    coordinate.paint(canvas, size);
    canvas.translate(size.width / 2, size.height / 2);
//    _drawFill(canvas);
    _drawStroke(canvas);
  }

  void _drawFill(Canvas canvas) {
    canvas.save();
    canvas.translate(-200, 0);
    canvas.drawCircle(Offset(0, 0), 60, _paint);
    canvas.restore();

    var rect = Rect.fromCenter(center: Offset(0, 0), height: 100, width: 120);
    canvas.drawOval(rect, _paint);

    canvas.save();
    canvas.translate(200, 0);
    //drawArc（矩形区域、起始弧度、扫描弧度、是否连中心，画笔）
    canvas.drawArc(rect, 0, pi / 2 * 3, true, _paint);
    canvas.restore();
  }

  void _drawStroke(Canvas canvas) {
    _paint..style = PaintingStyle.stroke;
    canvas.save();
    var rect =
        Rect.fromCenter(center: Offset(-200, 0), width: 100, height: 100);
    canvas.drawArc(rect, 0, pi / 2 * 3, false, _paint);
    canvas.restore();

    canvas.save();
    var rect1 =
        Rect.fromCenter(center: Offset(-60, 0), width: 100, height: 100);
    canvas.drawArc(rect1, 0, pi / 2 * 3, true, _paint);
    canvas.restore();

    canvas.save();
    var rect2 =
        Rect.fromCenter(center: Offset(100, 0), width: 100, height: 100);
    var a = pi / 8;
    canvas.drawArc(rect2, a, 2 * pi - a.abs() * 2, true,
        _paint..style = PaintingStyle.fill);
    canvas.restore();

    canvas.save();
    canvas.drawCircle(Offset(130, 0), 5, _paint);
    canvas.restore();

    canvas.save();
    canvas.drawCircle(Offset(150, 0), 5, _paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
