import 'package:flutter/material.dart';
import 'package:good_house_renting/widgets/common_image.dart';

class AppSearchBar extends StatefulWidget {
  /// 是否展示位置按钮
  final bool showLocation;

  /// 是否展示位置 icon
  final bool showMap;

  /// 返回按钮的回调
  final Function? gobackCallback;

  /// 输入的值
  final String? inputValue;

  /// placeholder 默认值
  final String defaultInputValue;

  /// 取消按钮点击
  final Function? onCancel;

  /// 点击搜索框的方法
  final Function? onSearch;

  /// 输入值改变的回调
  final ValueChanged<String>? onSearchSubmit;

  const AppSearchBar({
    super.key,
    this.showLocation = false,
    this.showMap = false,
    this.gobackCallback,
    this.inputValue,
    this.defaultInputValue = '请输入搜索值...',
    this.onCancel,
    this.onSearch,
    this.onSearchSubmit,
  });

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  String _searchWord = '';
  late TextEditingController _controller;
  void _onClean() {
    setState(() {
      _controller.clear();
      _searchWord = '';
    });
  }

  @override
  void initState() {
    _controller = TextEditingController(text: widget.inputValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (widget.showLocation )
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: () {},
              child: const Row(
                children: [
                  Icon(Icons.room, color: Colors.green, size: 16.0),
                  Text('北京',
                      style: TextStyle(color: Colors.black, fontSize: 14.0))
                ],
              ),
            ),
          ),
        if (widget.gobackCallback != null)
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: widget.gobackCallback!(),
              child: const Icon(Icons.chevron_left, color: Colors.black87),
            ),
          ),
        Expanded(
          child: Container(
            height: 34.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.0),
                color: Colors.grey.withAlpha(600)),
            margin: const EdgeInsets.only(right: 10.0),
            child: TextField(
              controller: _controller,
              style: const TextStyle(fontSize: 14.0),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(top: 1.0, left: -10.0),
                border: InputBorder.none,
                hintText: widget.defaultInputValue,
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 14.0),
                icon: const Padding(
                  padding: EdgeInsets.only(top: 1.0, left: 10.0),
                  child: Icon(Icons.search, size: 18.0, color: Colors.grey),
                ),
                suffixIcon: GestureDetector(
                  onTap: _onClean,
                  child: Icon(Icons.clear,
                      size: 18.0,
                      color: _searchWord == ''
                          ? Colors.grey.withAlpha(0)
                          : Colors.grey),
                ),
              ),
              onTap: () {
                if (widget.onSearch != null) {
                  widget.onSearch!();
                }
              },
              onSubmitted: (String inputedValue) {
                if (widget.onSearchSubmit != null) {
                  widget.onSearchSubmit!(inputedValue);
                }
              },
              onChanged: (String value) {
                setState(() {
                  _searchWord = value;
                });
              },
              textInputAction: TextInputAction.search,
            ),
          ),
        ),
        if (widget.onCancel != null)
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: widget.onCancel!(),
              child: const Text('取消',
                  style: TextStyle(fontSize: 14.0, color: Colors.black)),
            ),
          ),
        if (widget.showMap )
          const CommonImage(src: 'static/icons/widget_search_bar_map.png')
      ],
    );
  }
}
