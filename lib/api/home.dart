// 封装一个api，目的是返回业务侧需要的数据
import 'package:hm_shop/constants/index.dart';
import 'package:hm_shop/utils/dio_request.dart';
import 'package:hm_shop/viewmodels/home/banner.dart';
import 'package:hm_shop/viewmodels/home/category.dart';
import 'package:hm_shop/viewmodels/home/good_detail_item.dart';
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
    await dioRequest.get(HttpConstants.PRODUCT_LIST),
  );
}

// 热榜推荐
Future<SpecialRecommendResult> getInVogueListAPI() async {
  // 返回请求
  return SpecialRecommendResult.fromJSON(
    await dioRequest.get(HttpConstants.IN_VOGUE_LIST),
  );
}

// 一站式推荐
Future<SpecialRecommendResult> getOneStopListAPI() async {
  // 返回请求
  return SpecialRecommendResult.fromJSON(
    await dioRequest.get(HttpConstants.ONE_STOP_LIST),
  );
}

// 推荐列表
Future<List<GoodDetailItem>> getRecommendListAPI(
  Map<String, dynamic> params,
) async {
  // 返回请求
  return ((await dioRequest.get(HttpConstants.RECOMMEND_LIST, params: params))
          as List)
      .map((item) {
        return GoodDetailItem.fromJSON(item as Map<String, dynamic>);
      })
      .toList();
}
