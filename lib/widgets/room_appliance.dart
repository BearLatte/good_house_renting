import 'package:flutter/material.dart';
import 'package:good_house_renting/config.dart';
import 'package:good_house_renting/widgets/common_check_button.dart';

class RoomApplianceItem {
  final String title;
  final int iconPoint;
  final bool isChecked;

  const RoomApplianceItem(this.title, this.iconPoint, this.isChecked);
}

const List<RoomApplianceItem> _dataList = [
  RoomApplianceItem('衣柜', 0xe918, false),
  RoomApplianceItem('洗衣机', 0xe917, false),
  RoomApplianceItem('空调', 0xe90d, false),
  RoomApplianceItem('天然气', 0xe90f, false),
  RoomApplianceItem('冰箱', 0xe907, false),
  RoomApplianceItem('暖气', 0xe910, false),
  RoomApplianceItem('电视', 0xe908, false),
  RoomApplianceItem('热水器', 0xe912, false),
  RoomApplianceItem('宽带', 0xe90e, false),
  RoomApplianceItem('沙发', 0xe913, false)
];

class RoomAppliance extends StatefulWidget {
  final ValueChanged<List<RoomApplianceItem>>? valueChanged;

  const RoomAppliance({super.key, this.valueChanged});

  @override
  State<RoomAppliance> createState() => _RoomApplianceState();
}

class _RoomApplianceState extends State<RoomAppliance> {
  List<RoomApplianceItem> list = _dataList;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Wrap(
        runSpacing: 30.0,
        children: list
            .map(
              (item) => GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  debugPrint('DEBUG: 方法执行了');
                  setState(() {
                    list = list
                        .map((innnerItem) => innnerItem == item
                            ? RoomApplianceItem(
                                item.title, item.iconPoint, !item.isChecked)
                            : innnerItem)
                        .toList();
                  });
                  if (widget.valueChanged != null) {
                    widget.valueChanged!(list);
                  }
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 5,
                  child: Column(
                    children: [
                      Icon(
                        IconData(
                          item.iconPoint,
                          fontFamily: Config.ConmmonIcon,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(bottom: 10.0)),
                      Text(item.title),
                      const Padding(padding: EdgeInsets.only(bottom: 10.0)),
                      CommonCheckButton(isChecked: item.isChecked)
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
