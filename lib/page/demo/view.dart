import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:liang_flutter_demo/page/topcircle/page.dart';

import 'BusinessPage/page.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(DemoState state, Dispatch dispatch, ViewService viewService) {
  const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  final datas = new List.from(["我说啊", "你说啊", "他说啊"]);
  List<Widget> _widgetOptions = <Widget>[
    TopCirclePage().buildPage(null),
//
//    PageView.builder(
//        physics: BouncingScrollPhysics(),
//        scrollDirection: Axis.horizontal,
//        itemCount: datas.length,
//        itemBuilder: (context, index) {
//          return Container(
//            child: new PageItem(context,index,datas[index]),
//            width: MediaQuery.of(context).size.width,
//            height: 200,
//            color: Colors.accents[index%Colors.accents.length],
//          );
//        }),
    BusinessPage().buildPage(null),
    EasyRefresh(
      child: new SingleChildScrollView(
        child: Text(
          'Index 2: School',
          style: optionStyle,
        ),
      ),
      onRefresh: () async {},
      onLoad: () async {},
    ),
  ];

  const h = 30.0;

  return Scaffold(
      body: Center(
          child: Stack(
           children: [
           _widgetOptions.elementAt(state.selectedIndex),

        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon:
                SvgPicture.asset("assets/images/test.svg", height: h, width: h),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.business,
              size: h,
            ),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.school,
              size: h,
            ),
            title: Text('School'),
          ),
        ],
        currentIndex: state.selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (currentIndex) {
          dispatch(DemoActionCreator.onAction(currentIndex));
        },
      ));
}
