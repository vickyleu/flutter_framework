import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'newPage/Home/HomePage.dart';
import 'page/demo/page.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details, { bool forceReport: false }) {
    FlutterError.dumpErrorToConsole(details, forceReport: true);
  };
  runApp(MyApp());
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      title: 'Flutter Demo',
      theme: CupertinoThemeData(
        primaryColor: Colors.blue,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      );
  }
}
