import 'package:flutter/material.dart';
import 'package:good_house_renting/util/common_picker/index.dart';
import 'package:good_house_renting/widgets/common_form_item.dart';

class CommonSelectFormItem extends StatelessWidget {
  final String label;
  final List<String> options;
  final int value;
  final Function(int)? onChanged;

  const CommonSelectFormItem(
    this.label, {
    super.key,
    required this.options,
    required this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CommonFormItem(
      label,
      contentBuilder: (context) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            var result = CommonPicker.showPicker(
                context: context, options: options, value: value);

            result.then((selectedValue) {
              if (value != selectedValue &&
                  selectedValue != null &&
                  onChanged != null) {
                onChanged!(selectedValue);
              }
            });
          },
          child: SizedBox(
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(options[value]),
                const Icon(Icons.keyboard_arrow_right)
              ],
            ),
          ),
        );
      },
    );
  }
}
