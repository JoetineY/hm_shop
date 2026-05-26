import 'package:flutter/material.dart';

// 轻提示组件
class ToastUtils {
  static void showToast(BuildContext context, String? msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 120,
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
