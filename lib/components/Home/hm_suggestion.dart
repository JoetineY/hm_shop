// 首页推荐组件
import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home/special_recommend.dart';

class HmSuggestion extends StatefulWidget {
  final SpecialRecommendResult specialRecommendResult;
  const HmSuggestion({super.key, required this.specialRecommendResult});

  @override
  State<StatefulWidget> createState() => _HmSuggestionState();
}

class _HmSuggestionState extends State<HmSuggestion> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        // height: 300,
        alignment: Alignment.center,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage("special_recommend/home_cmd_sm.png"), // 专门配置本地资源
            fit: BoxFit.cover, // 撑满
          ),
        ),
        child: Column(
          children: [
            // 上面内容
            _buildHeader(),
            SizedBox(height: 10),
            Row(
              children: [
                _buildBottomLeft(),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _buildBottomRight(),
                  ),
                ),
              ],
            ),
            //
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Text(
          "特惠推荐",
          style: TextStyle(
            color: Color.fromARGB(255, 86, 24, 20),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(width: 10),
        Text(
          "精选省攻略",
          style: TextStyle(
            color: Color.fromARGB(255, 124, 63, 58),
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  // 底部左侧结构
  Widget _buildBottomLeft() {
    return Container(
      width: 100,
      height: 140,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("special_recommend/home_cmd_inner.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // 底部左侧结构
  List<Widget> _buildBottomRight() {
    List<GoodsItem> list = _getDisplayItems();
    return List.generate(list.length, (int index) {
      return Column(
        children: [
          ClipRRect(
            // 该组件可以包裹子元素，裁剪图片设置圆角
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              list[index].picture,
              width: 100,
              height: 140,
              fit: BoxFit.cover,
              errorBuilder: (contect, error, StackTrace) {
                // 当图片构建失败，可以返回新的部件替换原有图片
                return Image.asset("special_recommend/home_cmd_inner.png");
              },
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(255, 240, 96, 12),
            ),
            child: Text(
              "￥${list[index].price}",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      );
    });
  }

  // 只取前3条数据
  List<GoodsItem> _getDisplayItems() {
    if (widget.specialRecommendResult.subTypes.isEmpty) {
      return [];
    }
    return widget.specialRecommendResult.subTypes.first.goodsItems.items
        .take(3)
        .toList();
  }
}
