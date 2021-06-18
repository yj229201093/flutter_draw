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
    final Paint paint = Paint();

    /// 画笔设置
    paint
      ..color = Colors.blue // 颜色 蓝色
      ..strokeWidth = 4 // 线宽 4
      ..style = PaintingStyle.stroke; // 样式
    /// 绘制线  两点 加 画笔的设置
    canvas.drawLine(Offset(0, 0), Offset(100, 100), paint);
    Path path = Path(); // 路劲
    path.moveTo(100, 100);
    path.lineTo(200, 0);

    /// 绘制路径
    canvas.drawPath(path, paint..color = Colors.red);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
