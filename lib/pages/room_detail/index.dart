import 'package:flutter/material.dart';
import 'package:good_house_renting/pages/home/info/index.dart';
import 'package:good_house_renting/pages/room_detail/data.dart';
import 'package:good_house_renting/widgets/common_swipper.dart';
import 'package:good_house_renting/widgets/common_tag.dart';
import 'package:good_house_renting/widgets/common_title.dart';
import 'package:good_house_renting/widgets/room_appliance.dart';
import 'package:share_plus/share_plus.dart';

class RoomDetailPage extends StatefulWidget {
  final String roomId;

  const RoomDetailPage({super.key, required this.roomId});

  @override
  State<RoomDetailPage> createState() => _RoomDetailPageStatae();
}

class _RoomDetailPageStatae extends State<RoomDetailPage> {
  late RoomDetailData data;
  bool _isLike = false;
  bool _showAlltext = false;

  @override
  void initState() {
    setState(() {
      data = defaultData;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var showTextTool = (data.subTitle ?? '').length > 100;
    return Scaffold(
      appBar: AppBar(
        title: Text(data.title ?? ''),
        actions: [
          IconButton(
            onPressed: () {
              Share.share('https://www.i-blog.online');
            },
            icon: const Icon(Icons.share),
          )
        ],
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              CommonSwipper(images: data.houseImgs ?? []),
              CommonTitle(title: data.title ?? ''),
              Container(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      data.price.toString(),
                      style:
                          const TextStyle(fontSize: 20.0, color: Colors.pink),
                    ),
                    const Text(
                      '元/月(押一付三)',
                      style: TextStyle(color: Colors.pink),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.only(left: 10.0, top: 6.0, bottom: 6.0),
                child: Wrap(
                  spacing: 4.0,
                  children:
                      (data.tags ?? []).map((tag) => CommonTag(tag)).toList(),
                ),
              ),
              const Divider(color: Colors.grey, indent: 10.0, endIndent: 10.0),
              Container(
                padding: const EdgeInsets.only(left: 10.0),
                child: Wrap(
                  runSpacing: 20.0,
                  children: [
                    BaseInfoItem('面积：${data.size}平米'),
                    BaseInfoItem('楼层：${data.floor}'),
                    BaseInfoItem('房型：${data.roomType}'),
                    const BaseInfoItem('装修：精装'),
                  ],
                ),
              ),
              const CommonTitle(title: '房屋配置'),
              RoomApplianceList(list: data.applicances ?? []),
              const CommonTitle(title: '房屋概况'),
              Container(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.subTitle ?? '暂无房屋概况',
                      maxLines: _showAlltext ? null : 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        showTextTool
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _showAlltext = !_showAlltext;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      _showAlltext ? '收起' : '展开',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    Icon(
                                      _showAlltext
                                          ? Icons.keyboard_arrow_up
                                          : Icons.keyboard_arrow_down,
                                      color: Colors.grey,
                                    )
                                  ],
                                ),
                              )
                            : Container(),
                        const Text(
                          '举报',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const CommonTitle(title: '猜你喜欢'),
              const Info(),
              const SizedBox(height: 70.0)
            ],
          ),
          bottomBar(),
        ],
      ),
    );
  }

  Widget bottomBar() {
    return Positioned(
      width: MediaQuery.of(context).size.width,
      height: 100.0,
      bottom: 0,
      child: Container(
        color: Colors.grey[200],
        padding: const EdgeInsets.only(
            top: 10.0, left: 20.0, bottom: 20.0, right: 20.0),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _isLike = !_isLike;
                });
              },
              child: Container(
                height: 51.0,
                width: 40.0,
                margin: const EdgeInsets.only(right: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      _isLike ? Icons.star : Icons.star_border,
                      size: 34.0,
                      color: _isLike ? Colors.green : Colors.black,
                    ),
                    Text(
                      _isLike ? '已收藏' : '收藏',
                      style: TextStyle(
                          fontSize: 12.0,
                          color: _isLike ? Colors.green : Colors.black),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.only(right: 5.0),
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: const Center(
                    child: Text(
                      '联系房东',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: const Center(
                    child: Text(
                      '预约看房',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BaseInfoItem extends StatelessWidget {
  final String content;
  const BaseInfoItem(this.content, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 3 * 10) * 0.5,
      child: Text(
        content,
        style: const TextStyle(fontSize: 16.0),
      ),
    );
  }
}
