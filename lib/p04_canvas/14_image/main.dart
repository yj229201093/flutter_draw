import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_draw/p04_canvas/14_image/paper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // 确定初始化
  SystemChrome.setPreferredOrientations(// 使设备横屏显示
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  SystemChrome.setEnabledSystemUIOverlays([]); // 全屏显示
  runApp(Paper());
}
