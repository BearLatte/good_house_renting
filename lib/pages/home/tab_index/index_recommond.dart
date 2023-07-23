import 'package:flutter/material.dart';
import 'package:good_house_renting/pages/home/tab_index/index_recommond_data.dart';
import 'package:good_house_renting/pages/home/tab_index/index_recommond_item_widget.dart';

class IndexRecommond extends StatelessWidget {
  final List<IndexRecommondItem> dataList;

  const IndexRecommond({super.key, this.dataList = indexRecommondData});

  @override
  Widget build(BuildContext context) {
    double itemSpacing = 10.0;
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(color: Color(0x08000000)),
      child: Column(children: [
        const Padding(padding: EdgeInsets.all(5)),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '房屋推荐',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '更多',
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
        const Padding(padding: EdgeInsets.all(5)),
        Wrap(
            runSpacing: itemSpacing,
            spacing: itemSpacing,
            children: dataList
                .map((item) => IndexRecommondItemWidget(data: item))
                .toList())
      ]),
    );
  }
}
