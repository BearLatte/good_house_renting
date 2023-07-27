import 'package:flutter/material.dart';
import 'package:good_house_renting/widgets/common_form_item.dart';

class CommonRadioFormItem extends StatelessWidget {
  final String label;
  final List<String> options;
  final int? value;
  final ValueChanged<int?>? onChanged;

  const CommonRadioFormItem(
    this.label, {
    super.key,
    required this.options,
    this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CommonFormItem(
      label,
      contentBuilder: (context) {
        return Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              options.length,
              (index) => Row(
                children: [
                  Radio(
                    value: index,
                    groupValue: value,
                    onChanged: onChanged,
                  ),
                  Text(options[index])
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
