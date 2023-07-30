// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:good_house_renting/util/commom_toast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

const List<String> defautImgs = [
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2tdgve1j30ku0bsn75.jpg',
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2whp87sj30ku0bstec.jpg',
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2tl1v3bj30ku0bs77z.jpg',
];

// 设置图片宽高
var imageWidth = 750.0;
var imageHeight = 424.0;
var imageWidgetHeightRatio = imageWidth / imageHeight; //宽高比

class CommonImagePicker extends StatefulWidget {
  final ValueChanged<List<File>>? onChanged;

  const CommonImagePicker({super.key, this.onChanged});

  @override
  State<CommonImagePicker> createState() => _CommonImagePickerState();
}

class _CommonImagePickerState extends State<CommonImagePicker> {
  List<File> files = [];

  _pickImage() async {
    var status = await Permission.photos.request();
    if (status == PermissionStatus.granted) {
      ImagePicker picker = ImagePicker();
      var image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;
      File imageFile = File(image.path);
      setState(() {
        files = files..add(imageFile);
      });

      if (widget.onChanged != null) {
        widget.onChanged!(files);
      }
    } else {
      CommonToast.showToast('请允许本应用访问您的相册');
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = (MediaQuery.of(context).size.width - 10 * 4) / 3;
    var height = width / imageWidgetHeightRatio;
    Widget addButton = GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: _pickImage,
      child: Container(
        width: width,
        height: height,
        color: Colors.grey,
        child: const Center(
          child: Text(
            '+',
            style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w100),
          ),
        ),
      ),
    );

    Widget wrapper(File imageFile) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          Image.file(
            imageFile,
            width: width,
            height: height,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: -20.0,
            right: -20.0,
            child: IconButton(
              onPressed: () {
                setState(() {
                  files = files..remove(imageFile);
                });
                if (widget.onChanged != null) {
                  widget.onChanged!(files);
                }
              },
              icon: const Icon(
                Icons.delete_forever,
                color: Colors.red,
              ),
            ),
          )
        ],
      );
    }

    List<Widget> list = files.map((file) => wrapper(file)).toList()
      ..add(addButton);

    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Wrap(
        spacing: 10.0,
        runSpacing: 10.0,
        children: list,
      ),
    );
  }
}
