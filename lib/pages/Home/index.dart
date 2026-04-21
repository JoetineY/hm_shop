import 'package:flutter/material.dart';
import 'package:hm_shop/components/Home/HmCategory.dart';
import 'package:hm_shop/components/Home/HmHot.dart';
import 'package:hm_shop/components/Home/HmMoreList.dart';
import 'package:hm_shop/components/Home/HmSlider.dart';
import 'package:hm_shop/components/Home/HmSuggestion.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<StatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Widget> _getScrollChildren() {
    return [
      SliverToBoxAdapter(child: HmSlider()), // 轮播图组件
      SliverToBoxAdapter(child: SizedBox(height: 10)), // 间隙布局
      // SliverGrid SliverList只能纵向排列，因此此处不使用这两个组件
      SliverToBoxAdapter(child: HmCategory()), // 主页分类组件
      SliverToBoxAdapter(child: SizedBox(height: 10)), // 间隙布局

      SliverToBoxAdapter(child: HmSuggestion()), // 主页推荐组件
      SliverToBoxAdapter(child: SizedBox(height: 10)), // 间隙布局

      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(child: HmHot()),
              SizedBox(width: 10),
              Expanded(child: HmHot()),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)), // 间隙布局
      
      HmMoreList(),  // 无限滚动列表组件
      SliverToBoxAdapter(child: SizedBox(height: 10)), // 间隙布局
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getScrollChildren());
  }
}
