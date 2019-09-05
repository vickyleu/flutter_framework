import 'dart:collection';
import 'dart:ui' as prefix0;

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
                collapseMode: CollapseMode.pin,
                background: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child:
                            SvgPicture.asset("assets/images/progress_bar8.svg"),
                      ),
                      Padding(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
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
              ),
              expandedHeight:
                  MediaQuery.of(context).size.width.toDouble() * 0.6,
            ),
            SliverPersistentHeader(
              // 可以吸顶的TabBar
              pinned: true,
              delegate: _StickyContainerDelegate(
                  child: PreferredSize(
                      preferredSize: Size.fromHeight(52.0),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            color: const Color(0XFFF76F6F),
                            height: 32,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 32),
                            child: Container(
                              color: Colors.transparent,
                              height: 20,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: Container(
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 3),
                                    color: Color(0XFFE6E6E6),
                                    spreadRadius: 0.1,
                                    blurRadius: 8,
                                  )
                                ],
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          '章节练习',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontFamily:'PingFang-SC-Regular.ttf',
                                              color: Color(0XFFf76f6f)),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 14, bottom: 14),
                                      child: VerticalDivider(),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          '题型练习',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontFamily:'PingFang',
                                              fontWeight: FontWeight.normal,
                                              color: Color(0Xff333333)),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ))),
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
                  childCount: 200,
                ),
              ),


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

class _StickyContainerDelegate extends SliverPersistentHeaderDelegate {
  final PreferredSize child;

  _StickyContainerDelegate({@required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return this.child;
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

  @override
  double get maxExtent => child.preferredSize.height;

  @override
  double get minExtent => child.preferredSize.height;
}
