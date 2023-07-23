import 'package:flutter/material.dart';
import 'package:good_house_renting/pages/home/info/index.dart';
import 'package:good_house_renting/pages/home/tab_index/index_navigator.dart';
import 'package:good_house_renting/pages/home/tab_index/index_recommond.dart';
import 'package:good_house_renting/widgets/common_swipper.dart';
import 'package:good_house_renting/widgets/search_bar/index.dart';

class TabIndex extends StatelessWidget {
  const TabIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppSearchBar(),
        backgroundColor: Colors.white,
      ),
      body: ListView(children: const [
        CommonSwipper(),
        IndexNavigator(),
        IndexRecommond(),
        Info(showTitle: true),
        Text('这是首页'),
      ]),
    );
  }
}
