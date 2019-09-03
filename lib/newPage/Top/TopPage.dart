import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:liang_flutter_demo/widget/AppExpansionTile.dart';

class TopPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TopState();
}

class TopState extends State<TopPage> with SingleTickerProviderStateMixin {
  var selectExpandIndex = -1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final map = new HashMap<int, GlobalKey<AppExpansionTileState>>();
    return Scaffold(
        body: Stack(
      children: <Widget>[
        CustomScrollView(
          controller: ScrollController(initialScrollOffset: 0),
          physics: BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar(
              elevation: 0,
              floating: false,
              pinned: true,
              backgroundColor: const Color(0XFFF76F6F),
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child:
//                        Image.asset("assets/images/wxbg.png")
                            SvgPicture.asset("assets/images/progress_bar8.svg"),
                      ),
                      Padding(
                        child: Column(
                          mainAxisSize:MainAxisSize.min ,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '已完成',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              '12565',
                              style:
                                  TextStyle(fontSize: 28, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              '总题数：6498631',
                              style:
                              TextStyle(fontSize: 10, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),

                          ],
                        ),
                        padding: EdgeInsets.only(bottom: 35),
                      ),
                    ],
                  ),
                ),
//                Image.asset("assets/images/wxbg.png"),
              ),
              expandedHeight:
                  MediaQuery.of(context).size.width.toDouble() * 0.6,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  if (map[index] == null)
                    map[index] = new GlobalKey<AppExpansionTileState>();
                  final key = map[index];
                  return Container(
                    alignment: Alignment.center,
//                  color: Colors.lightBlue[100 * (index % 9)],
                    child: AppExpansionTile(
                      key: key,
                      title: Text('你们啊,naive $index'),
                      initiallyExpanded: selectExpandIndex == index,
                      //默认是否展开
                      onExpansionChanged: (expand) {
                        if (expand) {
                          setState(() {
                            selectExpandIndex = index;
                            map.forEach((i, state) {
                              if (i != index) {
                                state?.currentState?.collapse();
                              }
                            });
                          });
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
                    child: Text("思想道德修养与法律",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ))),
              )),
            ),
            preferredSize: Size(double.infinity, 50)),
      ],
    ));
  }
}
