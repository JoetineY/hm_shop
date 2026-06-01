import 'package:flutter/material.dart';

// 轻提示组件
class ToastUtils {
  // 阀门控制，避免提示框显示频率跟不上点击频率
  static bool showLoading = false;
  static void showToast(BuildContext context, String? msg) {
    if (showLoading) {
      return;
    }
    showLoading = true;
    Future.delayed(Duration(seconds: 3), () {
      showLoading = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 180,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(40),
        ),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
        content: Text(msg ?? "加载成功", textAlign: TextAlign.center),
      ),
    );
  }
}
