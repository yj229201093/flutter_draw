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
  Paint _gridPint; // 画笔
  final double step = 20; // 小格边长
  final double strokeWidth = .5; // 线宽
  final Color color = Colors.grey; // 线颜色
  Paint _paint;

  PaperPainter() {
    _gridPint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = color;

    _paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    _drawCenter(canvas, size);
    _drawGrid(canvas, size);
    _drawAxis(canvas, size);
//    _drawRect(canvas);
//    _drawRRect(canvas);
    _drawDRRect(canvas);
  }

  //绘制中心点
  void _drawCenter(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
  }

  //绘制网格
  void _drawGrid(Canvas canvas, Size size) {
    _drawGridBottomRight(canvas, size);
    canvas.save();
    canvas.scale(1, -1); //沿x轴镜像
    _drawGridBottomRight(canvas, size);
    canvas.restore();

    canvas.save();
    canvas.scale(-1, 1); //沿y轴镜像
    _drawGridBottomRight(canvas, size);
    canvas.restore();

    canvas.save();
    canvas.scale(-1, -1);
    _drawGridBottomRight(canvas, size);
    canvas.restore();
  }

  //绘制右下角网格
  void _drawGridBottomRight(Canvas canvas, Size size) {
    canvas.save();
    for (int i = 0; i < size.height / step; i++) {
      canvas.drawLine(Offset(0, 0), Offset(size.width / 2, 0), _gridPint);
      canvas.translate(0, step);
    }
    canvas.restore();

    canvas.save();
    for (int i = 0; i < size.width / step; i++) {
      canvas.drawLine(Offset(0, 0), Offset(0, size.height / 2), _gridPint);
      canvas.translate(step, 0);
    }
    canvas.restore();
  }

  //绘制x y 轴
  void _drawAxis(Canvas canvas, Size size) {
    _paint
      ..color = Colors.blue
      ..strokeWidth = 1.5;
    canvas.drawLine(
        Offset(-size.width / 2, 0), Offset(size.width / 2, 0), _paint);
    canvas.drawLine(
        Offset(0, -size.height / 2), Offset(0, size.height / 2), _paint);
    canvas.drawLine(Offset(0, size.height / 2),
        Offset(0 - 7.0, size.height / 2 - 10), _paint);
    canvas.drawLine(Offset(0, size.height / 2),
        Offset(0 + 7.0, size.height / 2 - 10), _paint);
    canvas.drawLine(
        Offset(size.width / 2, 0), Offset(size.width / 2 - 10, 7), _paint);
    canvas.drawLine(
        Offset(size.width / 2, 0), Offset(size.width / 2 - 10, -7), _paint);
  }

  //矩形
  void _drawRect(Canvas canvas) {
    //矩形中心构造
    canvas.drawRect(
        Rect.fromCenter(center: Offset(0, 0), width: 160, height: 160), _paint);
    //矩形上下左右构造
    canvas.drawRect(
        Rect.fromLTRB(-120, -120, -80, -80), _paint..color = Colors.red);
    //矩形左上宽高构造
    canvas.drawRect(
        Rect.fromLTWH(80, -120, 40, 40), _paint..color = Colors.orangeAccent);
    //矩形内切圆构造
    canvas.drawRect(Rect.fromCircle(center: Offset(100, 100), radius: 20),
        _paint..color = Colors.green);
    //矩形两点构造
    canvas.drawRect(Rect.fromPoints(Offset(-80, 80), Offset(-120, 120)),
        _paint..color = Colors.yellow);
  }

  //圆角矩形
  void _drawRRect(Canvas canvas) {
    //圆角矩形fromRectXY构造
    canvas.drawRRect(
        RRect.fromRectXY(
            Rect.fromCenter(center: Offset(0, 0), width: 160, height: 160),
            20,
            20),
        _paint);
    //圆角矩形fromLTRBXY构造
    canvas.drawRRect(RRect.fromLTRBXY(-120, -120, -80, -80, 10, 10),
        _paint..color = Colors.red);

    //圆角矩形fromLTRBR构造
    canvas.drawRRect(RRect.fromLTRBR(80, -120, 120, -80, Radius.circular(10)),
        _paint..color = Colors.green);
    //圆角矩形fromLTRBAndCorners
    canvas.drawRRect(
        RRect.fromLTRBAndCorners(80, 80, 120, 120,
            bottomRight: Radius.elliptical(10, 10)),
        _paint..color = Colors.black);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromPoints(Offset(-120, 80), Offset(-80, 120)),
            bottomLeft: Radius.elliptical(10, 10)),
        _paint..color = Colors.blueGrey);
  }

  //矩形差
  void _drawDRRect(Canvas canvas) {
    _paint
      ..color = Colors.blue
      ..strokeWidth = 1.5;
    Rect outRect =
        Rect.fromCenter(center: Offset(0, 0), width: 160, height: 160);
    Rect inRect =
        Rect.fromCenter(center: Offset(0, 0), width: 100, height: 100);
    canvas.drawDRRect(RRect.fromRectXY(outRect, 20, 20),
        RRect.fromRectXY(inRect, 20, 20), _paint);

    Rect outRect2 =
        Rect.fromCenter(center: Offset(0, 0), width: 60, height: 60);
    Rect inRect2 = Rect.fromCenter(center: Offset(0, 0), width: 40, height: 40);
    canvas.drawDRRect(RRect.fromRectXY(outRect2, 15, 15),
        RRect.fromRectXY(inRect2, 10, 10), _paint..color = Colors.green);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
