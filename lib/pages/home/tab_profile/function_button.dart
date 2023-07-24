import 'package:flutter/material.dart';
import 'package:good_house_renting/pages/home/tab_profile/function_button_data.dart';

import 'function_buggon_widget.dart';

class FunctionButton extends StatelessWidget {
  final String? title;
  final String? imageUrl;
  final Function? onTap;

  const FunctionButton({super.key, this.title, this.imageUrl, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 1.0,
      runSpacing: 1.0,
      children: list.map((item) => FunctionButtonWidget(data: item)).toList(),
    );
  }
}
