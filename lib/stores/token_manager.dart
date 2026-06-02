import 'package:hm_shop/constants/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  // 返回持久化对象的实例对象
  Future<SharedPreferences> _getInstance() {
    return SharedPreferences.getInstance();
  }

  String _token = "";
  // 初始化token
  Future<void> init() async {
    final shPref = await _getInstance();
    _token = shPref.getString(GlobalConstants.TOKEN_KEY) ?? "";
  }

  // 设置token
  Future<void> setToken(String value) async {
    // 1.获取持久化实例
    final shPref = await _getInstance();

    // token写入到持久化磁盘，对于web是写入了Local storage中
    shPref.setString(GlobalConstants.TOKEN_KEY, value);
    _token = value;
  }

  // 获取token
  // 注意，此处应是一个同步方法
  String getToken() {
    return _token;
  }

  // 删除token
  Future<void> removeToken() async {
    final shPref = await _getInstance();
    shPref.remove(GlobalConstants.TOKEN_KEY); // 删除磁盘
    _token = ""; // 删除内存
  }
}

final TokenManager tokenManager = TokenManager();
