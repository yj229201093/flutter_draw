import 'package:flutter/material.dart';

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
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    drawInvertColors(canvas);
  }

  // strokeCap
  void drawStrokeCap(Canvas canvas) {
    Paint paint = Paint();
    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.blue
      ..strokeWidth = 20;

    canvas.drawLine(
        Offset(100, 100), Offset(100, 200), paint..strokeCap = StrokeCap.butt);
    canvas.drawLine(
        Offset(150, 100), Offset(150, 200), paint..strokeCap = StrokeCap.round);
    canvas.drawLine(Offset(200, 100), Offset(200, 200),
        paint..strokeCap = StrokeCap.square);
  }

  //StrokeJoin
  void drawStrokeJoin(Canvas canvas) {
    Paint paint = Paint();
    Path path = Path();
    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.blue
      ..strokeWidth = 20;
    path.moveTo(50, 50);
    path.lineTo(50, 150);
    path.relativeLineTo(100, -50);
    path.relativeLineTo(0, 100);
    canvas.drawPath(path, paint..strokeJoin = StrokeJoin.bevel);

    path.reset();
    path.moveTo(200, 50);
    path.lineTo(200, 150);
    path.relativeLineTo(100, -50);
    path.relativeLineTo(0, 100);
    canvas.drawPath(path, paint..strokeJoin = StrokeJoin.miter);

    path.reset();
    path.moveTo(350, 50);
    path.lineTo(350, 150);
    path.relativeLineTo(100, -50);
    path.relativeLineTo(0, 100);
    canvas.drawPath(path, paint..strokeJoin = StrokeJoin.round);
  }

  //StrokeMiterLimit
  void drawStrokeMiterLimit(Canvas canvas) {
    Paint paint = Paint();
    Path path = Path();
    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.blue
      ..strokeJoin = StrokeJoin.miter
      ..strokeWidth = 20;
    for (int i = 0; i < 4; i++) {
      path.reset();
      path.moveTo(150.0 * i, 50);
      path.lineTo(150.0 * i, 150);
      path.relativeLineTo(100, -(40.0 * i + 20));
      canvas.drawPath(path, paint..strokeMiterLimit = 2);
    }

    for (int i = 0; i < 4; i++) {
      path.reset();
      path.moveTo(150.0 * i, 250);
      path.lineTo(150.0 * i, 300);
      path.relativeLineTo(100, -(40.0 * i + 20));
      canvas.drawPath(path, paint..strokeMiterLimit = 3);
    }
  }

  //反色
  void drawInvertColors(Canvas canvas) {
    Paint paint = Paint();
    paint..color = Color(0xff009A44);
    canvas.drawCircle(Offset(100, 100), 50, paint..invertColors = false);
    canvas.drawCircle(Offset(100 + 120.0, 100), 50, paint..invertColors = true);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
