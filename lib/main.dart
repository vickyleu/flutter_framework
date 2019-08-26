import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'page/demo/page.dart';

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

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

    return CupertinoApp(
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      title: 'Flutter Demo',
      theme: CupertinoThemeData(
        primaryColor: Colors.blue,
      ),
//      home: Scaffold(body: scroll,),
      home: DemoPage().buildPage(null),
      debugShowCheckedModeBanner: false,
      );
  }
}
