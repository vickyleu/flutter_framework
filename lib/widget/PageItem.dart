import 'package:flutter/cupertino.dart';

class PageItem<T> extends StatefulWidget {
  T data;
  final index;

  PageItem(BuildContext context, this.index, this.data);

  @override
  State<StatefulWidget> createState() {
    return PageState(data, index);
  }
}

class PageState<T> extends State {
  T data;
  final index;

  PageState(this.data, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: _stateCondition(index, data),
      ),
    );
  }

  Widget _stateCondition(int index, T data) {
    if (index == 0) {
      return ListView.builder(
          itemCount: 100,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              height: 30,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 25,
                  itemBuilder: (context, index) {
                    return Text("试试看啊");
                  }),
            );
//            return Text("试试看啊");
          });
    } else {
      return Text("$data");
    }
  }
}
