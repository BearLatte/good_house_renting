import 'package:flutter/material.dart';
import 'package:good_house_renting/pages/home/tab_search/data_list.dart';
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
        backgroundColor: Colors.white,
        title: AppSearchBar(
          showLocation: true,
          showMap: true,
          onSearch: () {
            Navigator.of(context).pushNamed('search');
          },
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 44,
            child: Text('filterBar'),
          ),
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
