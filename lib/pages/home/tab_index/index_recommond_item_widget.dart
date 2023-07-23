import 'package:flutter/material.dart';
import 'package:good_house_renting/pages/home/tab_index/index_recommond_data.dart';
import 'package:good_house_renting/widgets/common_image.dart';

var textStyle = const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700);

class IndexRecommondItemWidget extends StatelessWidget {
  final IndexRecommondItem data;
  const IndexRecommondItemWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(data.navigateUri);
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(color: Colors.white),
        width: (MediaQuery.of(context).size.width - 3 * 10.0) / 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(data.title, style: textStyle),
                Text(data.subtitle, style: textStyle),
              ],
            ),
            CommonImage(src: data.imageUri, width: 55.0),
          ],
        ),
      ),
    );
  }
}
