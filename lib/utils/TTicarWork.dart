import 'package:rxdart/rxdart.dart';

import 'ApiDio.dart';

class TTicarWork {
  /*
  * 我的收藏商品列表
  * */
  Observable loadCollectGood(String pageNum, String pageSize) {
    Map<String, String> map = new Map();
    map["pageNum"] = pageNum;
    map["pageSize"] = pageSize;
    return ApiDio.getInstance().get("collection/good/list", params: map);
  }
}
