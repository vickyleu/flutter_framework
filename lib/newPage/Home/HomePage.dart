import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:liang_flutter_demo/newPage/Top/TopPage.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<HomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    const h = 30.0;
    List<Widget> _widgetOptions = <Widget>[
      TopPage(),
      Scaffold(body: Text("实时看"),),
      Scaffold(body: Text("实时看哟"),),
    ];

    return Scaffold(
        body: Center(
            child: Stack(
          children: [
            _widgetOptions.elementAt(selectedIndex),
          ],
        )),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/images/test.svg",
                  height: h, width: h),
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
          currentIndex: selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: (currentIndex) {
            setState(() {
              selectedIndex = currentIndex;
            });
          },
        ));
  }
}
