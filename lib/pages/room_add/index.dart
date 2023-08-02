import 'dart:io';

import 'package:flutter/material.dart';
import 'package:good_house_renting/widgets/common_floating_action_button.dart';
import 'package:good_house_renting/widgets/common_form_item.dart';
import 'package:good_house_renting/widgets/common_image_picker.dart';
import 'package:good_house_renting/widgets/common_radio_form_item.dart';
import 'package:good_house_renting/widgets/common_select_form_item.dart';
import 'package:good_house_renting/widgets/common_title.dart';
import 'package:good_house_renting/widgets/room_appliance.dart';

class RoomAddPage extends StatefulWidget {
  const RoomAddPage({super.key});

  @override
  State<RoomAddPage> createState() => _RoomAddPageState();
}

class _RoomAddPageState extends State<RoomAddPage> {
  int _rentType = 0;
  int _decorationType = 0;
  int _selectedHouseholdType = 0;
  int _selectedFloor = 0;
  int _selectedRriented = 0;

  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CommonFloatingActionButton(
        title: '提交',
        onTap: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: const Text('房源发布'),
      ),
      body: ListView(children: [
        const CommonTitle(title: '房源信息'),
        CommonFormItem(
          '小区',
          contentBuilder: (context) {
            return GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                Navigator.of(context).pushNamed('search');
              },
              child: const SizedBox(
                height: 40.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '请选择小区',
                      style: TextStyle(fontSize: 16.0, color: Colors.black54),
                    ),
                    Icon(Icons.keyboard_arrow_right)
                  ],
                ),
              ),
            );
          },
        ),
        CommonFormItem(
          '租金',
          hintText: '请输入租金',
          suffixText: '元/月',
          controller: TextEditingController(),
        ),
        CommonFormItem(
          '大小',
          hintText: '请输入房屋大小',
          suffixText: '平方米',
          controller: TextEditingController(),
        ),
        CommonRadioFormItem(
          '租赁方式',
          options: const ['合租', '整租'],
          value: _rentType,
          onChanged: (index) {
            setState(() {
              _rentType = index!;
            });
          },
        ),
        CommonSelectFormItem(
          '户型',
          options: const ['一居', '两居', '三居', '四居', '四居+'],
          value: _selectedHouseholdType,
          onChanged: (index) {
            setState(() {
              _selectedHouseholdType = index;
            });
          },
        ),
        CommonSelectFormItem(
          '楼层',
          options: const ['高楼层', '中楼层', '低楼层'],
          value: _selectedFloor,
          onChanged: (index) {
            setState(() {
              _selectedFloor = index;
            });
          },
        ),
        CommonSelectFormItem(
          '朝向',
          options: const ['东', '南', '西', '北'],
          value: _selectedRriented,
          onChanged: (index) {
            setState(() {
              _selectedRriented = index;
            });
          },
        ),
        CommonRadioFormItem(
          '装修',
          options: const ['精装', '简装'],
          value: _decorationType,
          onChanged: (index) {
            setState(() {
              _decorationType = index!;
            });
          },
        ),
        const CommonTitle(title: '房屋图像'),
        CommonImagePicker(onChanged: (List<File> files) {}),
        const CommonTitle(title: '房源标题'),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: TextField(
            controller: titleController,
            decoration: const InputDecoration(
                hintText: '请输入标题（例如：整租，小区名 2室 2000元)',
                border: InputBorder.none),
          ),
        ),
        const CommonTitle(title: '房源配置'),
        RoomAppliance(valueChanged: (value) {}),
        const CommonTitle(title: '房源描述'),
        Container(
          margin: const EdgeInsets.only(bottom: 100.0),
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: TextField(
            maxLines: 10,
            controller: descriptionController,
            decoration: const InputDecoration(
              hintText: '请输入房屋描述信息',
              border: InputBorder.none,
            ),
          ),
        )
      ]),
    );
  }
}
