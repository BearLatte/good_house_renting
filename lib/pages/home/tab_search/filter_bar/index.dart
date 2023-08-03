import 'package:flutter/material.dart';
import 'package:good_house_renting/pages/home/tab_search/filter_bar/data.dart';
import 'package:good_house_renting/pages/home/tab_search/filter_bar/item.dart';
import 'package:good_house_renting/util/common_picker/index.dart';

class FilterBar extends StatefulWidget {
  final ValueChanged<FilterBarResult>? onChanged;

  const FilterBar({super.key, this.onChanged});

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  bool _isAreaActive = false;
  bool _isRentTypeActive = false;
  bool _isPriceActive = false;
  final bool _isFilterActive = false;

  String _areaId = '';
  String _rentTypeId = '';
  String _priceId = '';
  final List<String> _moreIds = [];

  _onAreaChanged(context) {
    setState(() {
      _isAreaActive = true;
    });
    var result = CommonPicker.showPicker(
      context: context,
      options: areaList.map((e) => e.name).toList(),
      value: 0,
    ).whenComplete(() {
      setState(() {
        _isAreaActive = false;
      });
    });
    result.then((index) {
      if (index == null) return;
      setState(() {
        _areaId = areaList[index].id;
      });
    });
    _onChanged();
  }

  _onRentTypeChanged(context) {
    setState(() {
      _isRentTypeActive = true;
    });

    var result = CommonPicker.showPicker(
      context: context,
      options: rentTypeList.map((e) => e.name).toList(),
      value: 0,
    ).whenComplete(() {
      setState(() {
        _isRentTypeActive = false;
      });
    });

    result.then((index) {
      if (index == null) return;
      setState(() {
        _rentTypeId = rentTypeList[index].id;
      });
    });
    _onChanged();
  }

  _onPriceChanged(context) {
    setState(() {
      _isPriceActive = true;
    });

    var result = CommonPicker.showPicker(
      context: context,
      options: priceList.map((e) => e.name).toList(),
      value: 0,
    ).whenComplete(() {
      setState(() {
        _isPriceActive = false;
      });
    });

    result.then((index) {
      if (index == null) return;
      setState(() {
        _priceId = priceList[index].id;
      });
    });

    _onChanged();
  }

  _onFilterChanged(context) {
    // setState(() {
    //   _isFilterActive = true;
    // });

    Scaffold.of(context).openEndDrawer();

    _onChanged();
  }

  _onChanged() {
    if (widget.onChanged != null) {
      widget.onChanged!(FilterBarResult(
        areaId: _areaId,
        rentTypeId: _rentTypeId,
        priceId: _priceId,
        moreIds: _moreIds,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41.0,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.0,
            color: Colors.black12,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FilterBarItem(
            '区域',
            isActive: _isAreaActive,
            onTap: _onAreaChanged,
          ),
          FilterBarItem(
            '方式',
            isActive: _isRentTypeActive,
            onTap: _onRentTypeChanged,
          ),
          FilterBarItem(
            '租金',
            isActive: _isPriceActive,
            onTap: _onPriceChanged,
          ),
          FilterBarItem(
            '筛选',
            isActive: _isFilterActive,
            onTap: _onFilterChanged,
          ),
        ],
      ),
    );
  }
}
