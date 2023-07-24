import 'package:flutter/material.dart';
import 'package:good_house_renting/util/commom_toast.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('设置')),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {
                CommonToast.showToast('已经退出登录');
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)))),
              child: const Text('退出登录', style: TextStyle(color: Colors.red)),
            ),
          )
        ],
      ),
    );
  }
}
