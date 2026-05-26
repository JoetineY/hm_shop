import 'package:flutter/material.dart';
import 'package:hm_shop/api/home.dart';
import 'package:hm_shop/components/Home/hm_category.dart';
import 'package:hm_shop/components/Home/hm_hot.dart';
import 'package:hm_shop/components/Home/hm_more_list.dart';
import 'package:hm_shop/components/Home/hm_slider.dart';
import 'package:hm_shop/components/Home/hm_suggestion.dart';
import 'package:hm_shop/viewmodels/home/banner.dart';
import 'package:hm_shop/viewmodels/home/category.dart';
import 'package:hm_shop/viewmodels/home/good_detail_item.dart';
import 'package:hm_shop/viewmodels/home/special_recommend.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<StatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<BannerItem> _bannnerList = [];  // banner数据
  List<CategoryItem> _categoryList = [];  // 分类数据
  SpecialRecommendResult _specialRecommendResult = SpecialRecommendResult(
    id: "",
    title: "",
    subTypes: []
  );  // 特惠推荐数据
  SpecialRecommendResult _inVogueResult = SpecialRecommendResult(
    id: "",
    title: "",
    subTypes: [],
  );// 热榜推荐
  SpecialRecommendResult _oneStopResult = SpecialRecommendResult(
    id: "",
    title: "",
    subTypes: [],
  );  // 一站式推荐
  List<GoodDetailItem> _recommendList = [];  // 推荐列表

  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _getBannerList();
    _getCategoryList();
    _getSpecialRecommend();
    _getInVogueList();
    _getOneStopList();
    _getRecommendList();
    _registerEvent();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _controller, 
      slivers: _getScrollChildren()
    );
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

  // 获取特惠推荐数据
  void _getSpecialRecommend() async {
    _specialRecommendResult = await getSpecialRecommendResultAPI();
    setState(() {});
  }

  // 获取热榜推荐列表
  void _getInVogueList() async {
    _inVogueResult = await getInVogueListAPI();
    setState(() {});
  }

  // 获取一站式推荐列表
  void _getOneStopList() async {
    _oneStopResult = await getOneStopListAPI();
    setState(() {});
  }

  int _page = 1;  // 页码
  bool _isLoading = false;  // 当前是否正在加载，要求同一时间只能加载一个请求
  bool _hasMore = true;  // 是否还有下一页
  // 获取推荐列表
  void _getRecommendList() async {
    if (_isLoading || !_hasMore) {
      return;
    }
    _isLoading = true;
    int requestLimit = _page + 8;
    _recommendList = await getRecommendListAPI({"limit": requestLimit});
    _isLoading = false;
    setState(() {});
    // 我要10条，你给10条，我要的你都给了，说明接着会有下一页。
    // 我要10条。你给9条，我要的你没给全，说明已经是最后一页了
    if (_recommendList.length < requestLimit) {
      _hasMore = false;
      return;
    }
    _page++;
  }

  
  void _registerEvent() {
    // 监听滚动到底部的事件
    _controller.addListener(() {
      // _controller.position.pixels 表示滚动视图当前已经滚动的像素距离，当列表在最顶部时，pixels 的值是 0.0
      // _controller.position.maxScrollExtent 表示滚动视图最大可以滚动的像素距离。=整个可滚动内容的总长度-屏幕可见区域的长度。
      if (_controller.position.pixels >= (_controller.position.maxScrollExtent - 50)) {
        // 当用户滚动到接近列表底部时，自动触发加载下一页
        _getRecommendList();
      }
    });
  }

  List<Widget> _getScrollChildren() {
    return [
      SliverToBoxAdapter(child: HmSlider(bannerList: _bannnerList,)), // 轮播图组件
      SliverToBoxAdapter(child: SizedBox(height: 10)), // 间隙布局

      // SliverGrid SliverList只能纵向排列，因此此处不使用这两个组件
      SliverToBoxAdapter(child: HmCategory(categoryList: _categoryList,)), // 主页分类组件
      SliverToBoxAdapter(child: SizedBox(height: 10)), // 间隙布局

      SliverToBoxAdapter(child: HmSuggestion(specialRecommendResult: _specialRecommendResult)), // 主页特惠推荐推荐组件
      SliverToBoxAdapter(child: SizedBox(height: 10)), // 间隙布局

      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                child: HmHot(result: _inVogueResult, type: "hot"),
              ),
              SizedBox(width: 10),
              Expanded(
                child: HmHot(result: _oneStopResult, type: "step"),
              ),
            ],
          ),
        ),  // 爆款推荐
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)), // 间隙布局

      HmMoreList(recommendList: _recommendList), // 推荐列表（无限滚动列表组件）
      SliverToBoxAdapter(child: SizedBox(height: 10)), // 间隙布局
    ];
  }
}
