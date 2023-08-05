import 'package:flutter/material.dart';
import 'package:good_house_renting/pages/home/tab_search/filter_bar/data.dart';
import 'package:good_house_renting/scoped_model/room_filter.dart';
import 'package:good_house_renting/util/scoped_model_helper.dart';
import 'package:good_house_renting/widgets/common_title.dart';

class FilterDrawer extends StatelessWidget {
  const FilterDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var selectedIds = ScopedModelHelper.getModel<FileterBarModel>(context)
        .selectedList
        .toList();

    // ignore: no_leading_underscores_for_local_identifiers
    _onChanged(String value) {
      ScopedModelHelper.getModel<FileterBarModel>(context)
          .selectedListToggleItem = value;
    }

    return Drawer(
      child: SafeArea(
          child: ListView(
        children: [
          const CommonTitle(title: '户型'),
          FilterDrawerItem(
            list: roomTypeList,
            selectedIds: selectedIds,
            onChanged: _onChanged,
          ),
          const CommonTitle(title: '朝向'),
          FilterDrawerItem(
            list: orientedList,
            selectedIds: selectedIds,
            onChanged: _onChanged,
          ),
          const CommonTitle(title: '楼层'),
          FilterDrawerItem(
            list: floorList,
            selectedIds: selectedIds,
            onChanged: _onChanged,
          ),
        ],
      )),
    );
  }
}

class FilterDrawerItem extends StatelessWidget {
  final List<GeneralType> list;
  final List<String> selectedIds;
  final ValueChanged<String>? onChanged;

  const FilterDrawerItem({
    super.key,
    required this.list,
    required this.selectedIds,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Wrap(
        spacing: 10.0,
        runSpacing: 10.0,
        children: list.map(
          (item) {
            var isActive = selectedIds.contains(item.id);
            return GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                if (onChanged != null) onChanged!(item.id);
              },
              child: Container(
                width: 100.0,
                height: 40.0,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.green, width: 1.0),
                    color: isActive ? Colors.green : Colors.white),
                child: Center(
                  child: Text(
                    item.name,
                    style: TextStyle(
                        color: isActive ? Colors.white : Colors.black),
                  ),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
