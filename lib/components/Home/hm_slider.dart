// 轮播图组件
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HmSlider extends StatefulWidget {
  List<BannerItem> bannerList;
  HmSlider({super.key, required this.bannerList});

  @override
  State<StatefulWidget> createState() => _HmSliderState();
}

class _HmSliderState extends State<HmSlider> {
  Widget _getSlider() {
    final double screenWidth = MediaQuery.of(context).size.width; // 获取屏幕宽度

    // 返回轮播图插件，需要先使用flutter pub add carousel_slider下载安装
    return CarouselSlider(
      items: List.generate(widget.bannerList.length, (int index) {
        return Image.network(
          widget.bannerList[index].imgUrl,
          fit: BoxFit.cover,
          width: screenWidth,
        );
      }),
      options: CarouselOptions(
        viewportFraction: 1,  // 设置视口比例
        autoPlay: true,    // 设置自动播放
        autoPlayInterval: Duration(seconds: 2),
        height: 300,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_getSlider()]);
  }
}
