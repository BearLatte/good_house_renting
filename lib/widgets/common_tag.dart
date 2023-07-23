import 'package:flutter/material.dart';

class CommonTag extends StatelessWidget {
  final String title;
  final Color color;
  final Color backgroundColor;

  const CommonTag.origin({
    super.key,
    required this.title,
    required this.color,
    required this.backgroundColor,
  });

  factory CommonTag(String title) {
    Color textColor;
    Color bgColor;
    switch (title) {
      case '近地铁':
        textColor = Colors.red;
        bgColor = Colors.red.withAlpha(50);
      case '集中供暖':
        textColor = Colors.green;
        bgColor = Colors.green.withAlpha(50);
      case '新上':
        textColor = Colors.blue;
        bgColor = Colors.blue.withAlpha(50);
      case '随时看房':
        textColor = Colors.orange;
        bgColor = Colors.orange.withAlpha(50);
      default:
        textColor = Colors.black;
        bgColor = Colors.grey;
    }

    return CommonTag.origin(
      title: title,
      color: textColor,
      backgroundColor: bgColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 4.0),
      padding:
          const EdgeInsets.only(top: 2.0, left: 4.0, bottom: 2.0, right: 4.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: color,
          fontSize: 10.0,
        ),
      ),
    );
  }
}
