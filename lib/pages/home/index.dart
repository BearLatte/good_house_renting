// 1. 新建文件  /pages/home/index.dart
// 2. 添加 material 依赖
import 'package:flutter/material.dart';
import 'package:good_house_renting/pages/home/tab_index/index.dart';
import 'package:good_house_renting/widgets/page_content.dart';

List<Widget> tabViewList = [
  const TabIndex(),
  const  PageContent(name: '找房'),
  const  PageContent(name: '资讯'),
  const  PageContent(name: '我的')
];

const  List<BottomNavigationBarItem> tabBarItems = [
  BottomNavigationBarItem(label: '首页', icon: Icon(Icons.home)),
  BottomNavigationBarItem(label: '找房', icon: Icon(Icons.search)),
  BottomNavigationBarItem(label: '资讯', icon: Icon(Icons.info)),
  BottomNavigationBarItem(label: '我的', icon: Icon(Icons.account_circle))
];

// 3. 编写无状态组件
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onSelected(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 4. 使用PageContent
    return Scaffold(
      body: tabViewList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: tabBarItems,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.green,
          onTap: _onSelected),
    );
  }
}
