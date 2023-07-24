import 'package:flutter/material.dart';
import 'package:good_house_renting/pages/home/info/index.dart';
import 'package:good_house_renting/widgets/search_bar/index.dart';

class TabInfo extends StatefulWidget {
  const TabInfo({super.key});

  @override
  State<TabInfo> createState() => _TabInfoState();
}

class _TabInfoState extends State<TabInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppSearchBar(onSearch: () {
          Navigator.of(context).pushNamed('search');
        }),
        backgroundColor: Colors.white,
      ),
      body: ListView(children: const [
        Padding(padding: EdgeInsets.only(bottom: 10)),
        Info(),
        Info(),
        Info(),
        Info(),
      ]),
    );
  }
}
