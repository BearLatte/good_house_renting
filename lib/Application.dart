// 1. 新建文件 /application
// 2. 添加依赖
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:good_house_renting/router/router_manager.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    // 配置路由
    FluroRouter router = FluroRouter();
    RouterManager.defineRoutes(router);
    return MaterialApp(
        theme: ThemeData(
            colorScheme: ColorScheme.light().copyWith(primary: Colors.green)),
        onGenerateRoute: router.generator);
  }
}
// 3. 使用 meterialApp
