import 'package:flutter/material.dart';
import 'package:good_house_renting/pages/home/tab_index/index_navigator.dart';
import 'package:good_house_renting/widgets/common_swipper.dart';

class TabIndex extends StatelessWidget {
  const TabIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('首页')),
      body: ListView(children: const [
        CommonSwipper(),
        IndexNavigator(),
        Text('这是首页'),
      ]),
    );
  }
}