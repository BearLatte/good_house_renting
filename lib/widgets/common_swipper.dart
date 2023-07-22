import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:good_house_renting/widgets/common_image.dart';

const List<String> defaultImages = [
  'http://images.xlink360.cn/FmLKjOlq8lw4xOdid4EYvDhhLsgM',
  'http://images.xlink360.cn/Fl0v57aMTTb-eikNaEzHFw4AJsM9',
  'http://images.xlink360.cn/FnOMHoP2fB7b4vJ55mHiot_YjVsa'
];

var imageWidth = 750.0;
var imageHeight = 424.0;

class CommonSwipper extends StatelessWidget {
  final List<String> images;

  const CommonSwipper({super.key, this.images = defaultImages});

  @override
  Widget build(BuildContext context) {
    var itemHeight =
        MediaQuery.of(context).size.width / imageWidth * imageHeight;
    return Container(
      height: itemHeight,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return CommonImage(
            src: images[index],
            fit: BoxFit.fill,
          );
        },
        itemCount: images.length,
        pagination: const SwiperPagination(),
      ),
    );
  }
}
