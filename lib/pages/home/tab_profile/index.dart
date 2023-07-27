import 'package:flutter/material.dart';
import 'package:good_house_renting/pages/home/info/index.dart';
import 'package:good_house_renting/pages/home/tab_profile/advertisement.dart';
import 'package:good_house_renting/pages/home/tab_profile/function_button.dart';
import 'package:good_house_renting/pages/home/tab_profile/header.dart';

class TabProfile extends StatelessWidget {
  const TabProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.back_hand), onPressed: () {},),
        title: const Text('我的'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('setting');
            },
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: ListView(children: const [
        ProfileHeader(),
        FunctionButton(),
        Advertisement(),
        Info(showTitle: true)
      ]),
    );
  }
}
