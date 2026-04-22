// 轮播图组件
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HmSlider extends StatefulWidget {
  final List<BannerItem> bannerList;
  const HmSlider({super.key, required this.bannerList});

  @override
  State<StatefulWidget> createState() => _HmSliderState();
}

class _HmSliderState extends State<HmSlider> {
  int _currentIndex = 0;  // 用于记录当前激活的索引
  CarouselSliderController _controller = CarouselSliderController(); // 控制轮播图跳转的控制器

  // 轮播图
  Widget _getSlider() {
    final double screenWidth = MediaQuery.of(context).size.width; // 获取屏幕宽度
    // 返回轮播图插件，需要先使用flutter pub add carousel_slider下载安装
    return CarouselSlider(
      carouselController: _controller, // 绑定controller
      items: List.generate(widget.bannerList.length, (int index) {
        return Image.network(
          widget.bannerList[index].imgUrl,
          fit: BoxFit.cover,
          width: screenWidth,
        );
      }),
      options: CarouselOptions(
        viewportFraction: 1, // 设置视口比例
        autoPlay: true, // 设置自动播放
        autoPlayInterval: Duration(seconds: 2),
        height: 300,
        onPageChanged: (int index, reason) {
          _currentIndex = index;
          setState(() {});
        },  // 该参数是当轮播图变换时触发
      ),
    );
  }

  // 搜索栏
  Widget _getSearch() {
    return Positioned(
      top: 10,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          height: 40,
          padding: EdgeInsets.symmetric(horizontal: 40),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.4),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            "搜索",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }

  // 返回指示灯导航部件
  Widget _getDots() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 10,
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.bannerList.length, (int index) {
            return GestureDetector(
              onTap: () {
                _controller.animateToPage(index);
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                height: 6,
                width: index == _currentIndex? 40 : 20,
                margin: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: index == _currentIndex ?  Colors.white : Color.fromRGBO(0, 0, 0, 0.3),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_getSlider(), _getSearch(), _getDots()]);
  }
}
