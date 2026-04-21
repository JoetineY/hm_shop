import 'package:flutter/material.dart';
import 'package:hm_shop/pages/Cart/index.dart';
import 'package:hm_shop/pages/Category/index.dart';
import 'package:hm_shop/pages/Home/index.dart';
import 'package:hm_shop/pages/Mine/index.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // 定义数据，根据数据进行渲染4个导航
  // 一般应用程序里的导航栏是不会变的
  final List<Map<String, String>> _tabList = [
    {
      "icon": "lib/assets/ic_public_home_normal.png", // 正常显示图标
      "active_icon": "lib/assets/ic_public_home_active.png", // 激活状态显示的图标
      "text": "首页",
    },
    {
      "icon": "lib/assets/ic_public_pro_normal.png", // 正常显示图标
      "active_icon": "lib/assets/ic_public_pro_active.png", // 激活状态显示的图标
      "text": "分类",
    },
    {
      "icon": "lib/assets/ic_public_cart_normal.png", // 正常显示图标
      "active_icon": "lib/assets/ic_public_cart_active.png", // 激活状态显示的图标
      "text": "购物车",
    },
    {
      "icon": "lib/assets/ic_public_my_normal.png", // 正常显示图标
      "active_icon": "lib/assets/ic_public_my_active.png", // 激活状态显示的图标
      "text": "个人中心",
    },
  ];

  int _currentIndex = 0;

  List<BottomNavigationBarItem> _getTabBarWidget() {
    // 返回导航栏图标
    return List.generate(_tabList.length, (int index) {
      return BottomNavigationBarItem(
        icon: Image.asset(_tabList[index]["icon"]!, width: 30, height: 30),
        activeIcon: Image.asset(
          _tabList[index]["active_icon"]!,
          width: 30,
          height: 30,
        ),
        label: _tabList[index]["text"],
      );
    });
  }

  List<Widget> _getChildren() {
    return [HomeView(), CategoryView(), CartView(), MineView()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: _currentIndex, children: _getChildren()),
      ), // 避开安全区组件
      bottomNavigationBar: BottomNavigationBar(
        items: _getTabBarWidget(),
        currentIndex: _currentIndex,
        onTap: (int index) {
          // index是当前点击的索引
          _currentIndex = index;
          setState(() {});
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true, // 展示未被选中的文本
      ),
    );
  }
}
