import 'package:hm_shop/constants/index.dart';
import 'package:hm_shop/utils/dio_request.dart';
import 'package:hm_shop/viewmodels/mine/goods_details_items.dart';

// 猜你喜欢接口
Future<GoodsDetailsItems> getGuessListAPI(Map<String, dynamic> params) async {
  return GoodsDetailsItems.fromJSON(
    await dioRequest.get(HttpConstants.GUESS_LIST, params: params),
  );
}
