// 1. 新建文件
// 2. 引入依赖
import 'package:flutter/material.dart';

import '../router/router_manager.dart';

// 3. 编写无状态组件
class PageContent extends StatelessWidget {
  // 添加 name 参数
  final String name;

  const PageContent({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('当前页面: $name')),
      body: ListView(
        children: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, RouterManager.home);
              },
              child: Text(RouterManager.home)),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, RouterManager.login);
              },
              child: Text(RouterManager.login)),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '');
              },
              child: const Text('not found')),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/room/6733577');
              },
              child: const Text('detail_page')),
        ],
      ),
    );
  }
}
