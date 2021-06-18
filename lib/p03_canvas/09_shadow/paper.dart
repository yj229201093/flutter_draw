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
  @override
  void paint(Canvas canvas, Size size) {
    coordinate.paint(canvas, size);
    canvas.translate(size.width / 2, size.height / 2);
    _drawShadow(canvas);
  }

  //绘制阴影
  void _drawShadow(Canvas canvas) {
    Path path = Path();
    path.lineTo(80, 80);
    path.lineTo(-80, 80);
    path.close();

    canvas.drawShadow(path, Colors.red, 3, true);
    canvas.translate(200, 0);
    canvas.drawShadow(path, Colors.red, 3, false);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
