import 'dart:_http';

import 'package:dio/dio.dart';

import 'ApiService.dart';

class ApiDio {
  static ApiDio instance;
  static ApiService apiService;
  static const String API_PREFIX = 'http://101.132.124.171:8080/demo-1.0/api';

  ApiDio() {
    var options = new BaseOptions(
        connectTimeout: 5000,
        receiveTimeout: 3000,
        baseUrl: API_PREFIX, // api 头部例如 https://www.baidu.com
        contentType: new ContentType('application', 'x-www-form-urlencoded',
            charset: 'utf-8'));
    Dio dio = new Dio(options);
    dio.interceptors.add(AuthInterceptor()); // 添加 token
    dio
      ..interceptors
          .add(LogInterceptor(responseBody: true, requestBody: true)); //添加日志
    apiService = new ApiService(dio);
  }

  static ApiService getInstance() {
    if (instance == null) {
      instance = new ApiDio();
    }
    return _getApiService();
  }

  static ApiService _getApiService() {
    return apiService;
  }
}

/// AuthInterceptor
///
/// 添加header认证
class AuthInterceptor extends Interceptor {
  String PLATFORM = "android"; //可根据代码进行判断
  String CLIENT = "store";

  @override
  onRequest(RequestOptions options) async {
    Map<String, String> headers = new Map();
    headers["Accept-Charset"] = "utf-8";
    headers["Connection"] = "keep-alive";
    headers["Accept"] = "*/*";
    headers["x-version"] = "1.0.0"; //自己更改配置
    headers["x-platform"] = PLATFORM;
    headers["x-client"] = CLIENT;
    headers["x-equCode"] = "1.0.0"; //自己更改配置
    headers["Authorization"] = "1.0.0"; //自己更改配置

    options.headers = headers;
    return super.onRequest(options);
  }
}
