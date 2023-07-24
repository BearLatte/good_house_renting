import 'package:flutter/material.dart';
import 'package:good_house_renting/widgets/common_image.dart';

class Advertisement extends StatelessWidget {
  const Advertisement({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          top: 30.0, left: 10.0, bottom: 20.0, right: 10.0),
      child: const CommonImage(
          src:
              'https://tva1.sinaimg.cn/large/006y8mN6ly1g6te62n8f4j30j603vgou.jpg'),
    );
  }
}
