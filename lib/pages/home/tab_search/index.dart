import 'package:flutter/material.dart';
import 'package:good_house_renting/pages/home/tab_search/data_list.dart';
import 'package:good_house_renting/pages/home/tab_search/filter_bar/filter_drawer.dart';
import 'package:good_house_renting/pages/home/tab_search/filter_bar/index.dart';
import 'package:good_house_renting/widgets/room_list_item_widget.dart';
import 'package:good_house_renting/widgets/search_bar/index.dart';

class TabSearch extends StatefulWidget {
  const TabSearch({super.key});

  @override
  State<TabSearch> createState() => _TabSearchState();
}

class _TabSearchState extends State<TabSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Container()],
        backgroundColor: Colors.white,
        elevation: 0,
        title: AppSearchBar(
          showLocation: true,
          showMap: true,
          onSearch: () {
            Navigator.of(context).pushNamed('search');
          },
        ),
      ),
      endDrawer: const FilterDrawer(),
      body: Column(
        children: [
          FilterBar(onChanged: (value) {}),
          Expanded(
            child: ListView(
              children: dataList
                  .map((item) => RoomListItemWidget(data: item))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
