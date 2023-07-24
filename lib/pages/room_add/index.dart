import 'package:flutter/material.dart';
import 'package:good_house_renting/widgets/common_floating_action_button.dart';

class RoomAddPage extends StatelessWidget {
  const RoomAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CommonFloatingActionButton(
        title: '提交',
        onTap: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: const Text('房源发布'),
      ),
      body: ListView(children: const [Text('内容区域')]),
    );
  }
}
