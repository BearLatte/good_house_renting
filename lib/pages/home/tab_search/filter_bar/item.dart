import 'package:flutter/material.dart';

class FilterBarItem extends StatelessWidget {
  final String title;
  final bool isActive;
  final Function(BuildContext context)? onTap;

  const FilterBarItem(
    this.title, {
    super.key,
    this.isActive = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var color = isActive ? Colors.green : Colors.black87;
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!(context);
        }
      },
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(color: color, fontSize: 18.0),
          ),
          Icon(
            Icons.arrow_drop_down,
            size: 20.0,
            color: color,
          )
        ],
      ),
    );
  }
}
