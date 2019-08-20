import 'TTicarWork.dart';

class TestUse {
  void avv() {
    new TTicarWork().loadCollectGood("1", "20").listen((request) {
//接口请求成功 （request为map） 自己设置解析数据
    }, onError: (e) {
      //请求异常等
    });
  }
}
