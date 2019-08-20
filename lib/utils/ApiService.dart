import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

class ApiService {
  ApiService(this.dio);

  Dio dio;

  //get请求结构
  Future _get(String url, {Map<String, dynamic> params}) async {
    var response = await dio.get(url, queryParameters: params);
    return response.data;
  }

  //post
  Future _post(String url, Map<String, dynamic> params) async {
    var response = await dio.post(url, data: params);
    return response.data;
  }

  Observable post(String url, Map<String, dynamic> params) =>
      Observable.fromFuture(_post(url, params)).asBroadcastStream();

  Observable get(String url, {Map<String, dynamic> params}) =>
      Observable.fromFuture(_get(url, params: params)).asBroadcastStream();
}
