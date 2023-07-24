import 'package:flutter/material.dart';
import 'package:good_house_renting/pages/home/tab_search/data_list.dart';
import 'package:good_house_renting/widgets/common_floating_action_button.dart';
import 'package:good_house_renting/widgets/room_list_item_widget.dart';

class RoomManagePage extends StatelessWidget {
  const RoomManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        floatingActionButton: CommonFloatingActionButton(
            title: '发布房源',
            onTap: () {
              Navigator.of(context).pushNamed('addRoom');
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          title: const Text('房屋管理'),
          bottom: const TabBar(tabs: [Tab(text: '已租'), Tab(text: '空置')]),
        ),
        body: TabBarView(children: [
          ListView(
            children:
                dataList.map((item) => RoomListItemWidget(data: item)).toList(),
          ),
          ListView(
            children:
                dataList.map((item) => RoomListItemWidget(data: item)).toList(),
          ),
        ]),
      ),
    );
  }
}
