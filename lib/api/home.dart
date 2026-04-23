// 封装一个api，目的是返回业务侧需要的数据
import 'package:hm_shop/constants/index.dart';
import 'package:hm_shop/utils/dio_request.dart';
import 'package:hm_shop/viewmodels/home.dart';

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
