import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'state.dart';

Widget buildView(
    TopCircleState state, Dispatch dispatch, ViewService viewService) {

  var selectExpandIndex=-1;

  return Scaffold(
      body: Stack(
    children: <Widget>[
      CustomScrollView(
        controller: ScrollController(initialScrollOffset: 0),
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("assets/images/wxbg.png"),
            ),
            expandedHeight: 156,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
//                  color: Colors.lightBlue[100 * (index % 9)],
                  child: ExpansionTile(
                    title: Text('你们啊,naive $index'),
                    initiallyExpanded: false,//默认是否展开
                    onExpansionChanged: (expand){
                      if(expand){
                        selectExpandIndex=index;
                      }
                    },
                    children: ["试试看啊", "试看", "看"]
                        .map((val) => new ListTile(
                              title: new Text(val),
                            ))
                        .toList(),

                  ),
                );
              },
              childCount: 20,
            ),
          )
        ],
      ),
      PreferredSize(
          child: Container(
            width: double.infinity,
            height: 90,
            decoration: BoxDecoration(color: Colors.transparent),
            child: SafeArea(
                child: Container(
              height: 50,
              width: double.infinity,
              child: Center(
                  child: Text("😑",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.yellow,
                      ))),
            )),
          ),
          preferredSize: Size(double.infinity, 50)),
    ],
  ));
}
