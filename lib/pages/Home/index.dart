import 'package:flutter/material.dart';
import 'package:hm_shop/api/home.dart';
import 'package:hm_shop/components/Home/hm_category.dart';
import 'package:hm_shop/components/Home/hm_hot.dart';
import 'package:hm_shop/components/Home/hm_more_list.dart';
import 'package:hm_shop/components/Home/hm_slider.dart';
import 'package:hm_shop/components/Home/hm_suggestion.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<StatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<BannerItem> _bannnerList = [];  // banner数据
  List<CategoryItem> _categoryList = [];  // 分类数据

  List<Widget> _getScrollChildren() {
    return [
      SliverToBoxAdapter(child: HmSlider(bannerList: _bannnerList,)), // 轮播图组件
      SliverToBoxAdapter(child: SizedBox(height: 10)), // 间隙布局

      // SliverGrid SliverList只能纵向排列，因此此处不使用这两个组件
      SliverToBoxAdapter(child: HmCategory(categoryList: _categoryList,)), // 主页分类组件
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

      HmMoreList(), // 无限滚动列表组件
      SliverToBoxAdapter(child: SizedBox(height: 10)), // 间隙布局
    ];
  }

  @override
  void initState() {
    super.initState();
    _getBannerList();
    _getCategoryList();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getScrollChildren());
  }

  // 获取轮播图列表
  void _getBannerList() async {
    _bannnerList = await getBannerListAPI();
    setState(() {});
  }

  // 获取分类列表
  void _getCategoryList() async {
    _categoryList = await getCategoryListAPI();
    setState(() {});
  }
}
