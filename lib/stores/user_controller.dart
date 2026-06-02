import 'package:get/get.dart';
import 'package:hm_shop/viewmodels/mine/user.dart';

// 需要共享的对象，需要一些共享的属性，属性需要响应式更新
class UserController extends GetxController {
  // .obs可以证明user对象被监听了，需要取值的话需要使用user.value
  var user = UserInfo.fromJSON({}).obs;

  dynamic updateUserInfo(UserInfo newUserInfo) {
    user.value = newUserInfo;
  }
}
