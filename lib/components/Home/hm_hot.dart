import 'package:flutter/material.dart';

class HmHot extends StatefulWidget {
  const HmHot({super.key});

  @override
  State<StatefulWidget> createState() => _HmHotState();
}

class _HmHotState extends State<HmHot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 200,
      alignment: Alignment.center,
      child: Text("爆款推荐", style: TextStyle(color: Colors.white)),
    );
  }
}
