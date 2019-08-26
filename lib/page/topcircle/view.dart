import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'state.dart';

Widget buildView(
    TopCircleState state, Dispatch dispatch, ViewService viewService) {
  final scroll = CustomScrollView(
    controller: ScrollController(initialScrollOffset: 0),
    physics: BouncingScrollPhysics(),
    shrinkWrap: true,
    slivers: <Widget>[
      SliverAppBar(
        floating: true,
        pinned: false,
        snap: true,
        flexibleSpace: FlexibleSpaceBar(
          background: Image.asset("assets/images/wxbg.png"),
        ),
        expandedHeight: 156,
      ),
      SliverList(
          delegate: SliverChildBuilderDelegate(
        (context, index) => ListTile(
          title: Text(
            "你们啊,naive",
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        childCount: 20,
      ))
    ],
  );
  return Scaffold(body: scroll);
}
