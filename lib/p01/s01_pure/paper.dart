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

/// 继承 CustomPainter类
class PaperPainter extends CustomPainter {
  @override // paint方法
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    /// 画笔对象
    final Paint paint = Paint();

    /// 在画布绘制圆，drawCircle方法是绘制圆，三个参数：圆心<drawCircle>，半径<10>, paint 画笔
    canvas.drawCircle(Offset(100, 100), 10, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
