// 1. 新建文件 /application
// 2. 添加依赖
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:good_house_renting/router/router_manager.dart';
import 'package:good_house_renting/scoped_model/room_filter.dart';
import 'package:scoped_model/scoped_model.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    // 配置路由
    FluroRouter router = FluroRouter();
    RouterManager.defineRoutes(router);
    return ScopedModel<FileterBarModel>(
        model: FileterBarModel(),
        child: MaterialApp(
          theme: ThemeData(
            colorScheme: const ColorScheme.light().copyWith(
              primary: Colors.green,
            ),
          ),
          onGenerateRoute: router.generator,
        ));
  }
}
// 3. 使用 meterialApp
