import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage_2/provider.dart';

final networkImageUrlReg = RegExp('^http');
final localImageUrlReg = RegExp('^static');

class CommonImage extends StatelessWidget {
  final String src;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const CommonImage({
    super.key,
    required this.src,
    this.width,
    this.height,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    if (networkImageUrlReg.hasMatch(src)) {
      // 网络图片
      return Image(
        fit: fit,
        width: width,
        height: height,
        image: AdvancedNetworkImage(
          src,
          useDiskCache: true,
          cacheRule: const CacheRule(maxAge: Duration(days: 7)),
          timeoutDuration: const Duration(seconds: 20),
        ),
      );
    }

    if (localImageUrlReg.hasMatch(src)) {
      // 本地图片
      return Image.asset(
        src,
        fit: fit,
        width: width,
        height: height,
      );
    }

    assert(false, '图片地址 src 不合法');
    return Container();
  }
}
