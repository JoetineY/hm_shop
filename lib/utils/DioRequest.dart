import 'package:dio/dio.dart';
import 'package:hm_shop/constants/index.dart';

class DioRequest {
  final _dio = Dio();
  DioRequest() {
    _dio.options
      ..baseUrl = GlobalConstants.BASE_URL
      ..connectTimeout = Duration(seconds: GlobalConstants.TIME_OUT)
      ..sendTimeout = Duration(seconds: GlobalConstants.TIME_OUT)
      ..receiveTimeout = Duration(seconds: GlobalConstants.TIME_OUT);

    // 配置拦截器
    _addInterceptor();
  }

  // 拦截器
  void _addInterceptor() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handler) {
          handler.next(request);
        },
        onResponse: (response, handler) {
          if (response.statusCode! >= 200 && response.statusCode! < 300) {
            handler.next(response);
            return;
          } else {
            handler.reject(
              DioException(requestOptions: response.requestOptions),
            );
          }
        },
        onError: (error, handler) {
          handler.reject(error);
        },
      ),
    );
  }

  // get请求
  Future<dynamic> get(String url, {Map<String, dynamic>? params}) {
    return _handleResponse(_dio.get(url, queryParameters: params));
  }

  // 进一步处理返回结果的函数
  Future<dynamic> _handleResponse(Future<Response<dynamic>> task) async {
    try {
      Response<dynamic> res = await task;
      final data = res.data as Map<String, dynamic>; // 这里的data才是我们真实的接口返回的数据
      if (data["code"] == GlobalConstants.SUCCESS_CODE) {
        // 此时才认定http状态和业务状态均正常，就可以真正的放行通过
        return data["result"];
      }
      throw Exception(data["msg"] ?? "加载数据异常");
    } catch (e) {
      throw Exception(e);
    }
  }
}

// dio请求工具发出请求，返回的数据是 Response<dynamic>.data
// 需要把所有的接口的data解放出来，拿到真正的数据，进而判断业务状态码是不是等于1

final dioRequest = DioRequest();  // 单例对象