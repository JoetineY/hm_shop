// 主页分类组件
import 'package:flutter/material.dart';

class HmCategory extends StatefulWidget {
  const HmCategory({super.key});

  @override
  State<StatefulWidget> createState() => _HmCategoryState();
}

class _HmCategoryState extends State<HmCategory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 100,
            width: 80,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 10),
            color: Colors.blue,
            child: Text(
              "分类${index + 1}",
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
