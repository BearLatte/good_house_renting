import 'package:flutter/material.dart';
import 'package:good_house_renting/pages/home/tab_profile/function_button_data.dart';
import 'package:good_house_renting/widgets/common_image.dart';

class FunctionButtonWidget extends StatelessWidget {
  final FunctionButtonItem data;
  const FunctionButtonWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (data.onTapHndler != null) {
          data.onTapHndler!(context);
        }
      },
      child: Container(
        margin: const EdgeInsets.only(top: 30.0),
        width: MediaQuery.of(context).size.width * 0.33,
        height: 90.0,
        child: Column(
          children: [
            CommonImage(src: data.imageUrl),
            Text(data.title),
          ],
        ),
      ),
    );
  }
}
