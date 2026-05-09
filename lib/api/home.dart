// 封装一个api，目的是返回业务侧需要的数据
import 'package:hm_shop/constants/index.dart';
import 'package:hm_shop/utils/dio_request.dart';
import 'package:hm_shop/viewmodels/home/banner.dart';
import 'package:hm_shop/viewmodels/home/category.dart';
import 'package:hm_shop/viewmodels/home/special_recommend.dart';

// 轮播图接口
Future<List<BannerItem>> getBannerListAPI() async {
  return ((await dioRequest.get(HttpConstants.BANNER_LIST)) as List)
      .map((item) => BannerItem.fromJSON(item as Map<String, dynamic>))
      .toList();
}

// 分类列表
Future<List<CategoryItem>> getCategoryListAPI() async {
  return (await dioRequest.get(HttpConstants.CATEGORY_LIST) as List)
      .map((item) => CategoryItem.fromJSON(item as Map<String, dynamic>))
      .toList();
}

// 特惠推荐接口
Future<SpecialRecommendResult> getSpecialRecommendResultAPI() async {
  return SpecialRecommendResult.fromJSON(
    await dioRequest.get(HttpConstants.PRODUCT_LIST)
  );
}
