import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(
    TopCircleState state, Dispatch dispatch, ViewService viewService) {
  return Container(
      child: Column(
       children: <Widget>[
         Container(
           transform: Matrix4.translationValues(
            0.0, -(MediaQuery.of(viewService.context).size.width * 0.2), 0.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: double.infinity, minHeight: 0),
            child: AspectRatio(
             aspectRatio: 375 / 226,
             child: Container(
              color: Colors.red,
            ),
          ),
        ),
       ),
       Container(
          child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return Text("你们啊,too young");
              }),
      ),
    ],
  ));
}
