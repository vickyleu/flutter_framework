import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'BusinessPage/page.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(DemoState state, Dispatch dispatch, ViewService viewService) {
  const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  List<Widget> _widgetOptions = <Widget>[
//    EasyRefresh(
//      child: new SingleChildScrollView(
//        child: Text(
//          'Index 0: 我是主页',
//          style: optionStyle,
//        ),
//      ),
//      onRefresh: () async {},
//      onLoad: () async {},
//    ),
    SingleChildScrollView(
      child: Text(
        'Index 0: 我是主页',
        style: optionStyle,
      ),
    ),
    // 这是第二个界面哦
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

  return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(state.selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/test.svg")),
//            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
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
