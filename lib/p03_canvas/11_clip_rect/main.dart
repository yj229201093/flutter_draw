import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_draw/p03_canvas/11_clip_rect/paper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // 确定初始化
  SystemChrome.setPreferredOrientations(// 使设备横屏显示
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  SystemChrome.setEnabledSystemUIOverlays([]); // 全屏显示
  runApp(Paper());
}
