import 'package:flutter/material.dart';
import 'package:good_house_renting/pages/home/info/data.dart';
import 'package:good_house_renting/widgets/common_image.dart';

var textStyle = const TextStyle(color: Colors.black54);

class ItemWidget extends StatelessWidget {
  final InfoItem data;
  const ItemWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
      child: Row(
        children: [
          CommonImage(
            src: data.imageUri,
            width: 120.0,
            height: 90.0,
            fit: BoxFit.cover,
          ),
          const Padding(padding: EdgeInsets.only(left: 10.0)),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(data.source, style: textStyle),
                  Text(data.time, style: textStyle),
                ],
              ),
            ],
          )),
        ],
      ),
    );
  }
}
