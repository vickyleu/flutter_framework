import 'package:fish_redux/fish_redux.dart';

class TopCircleState implements Cloneable<TopCircleState> {
  final args;
  TopCircleState(this.args);
  @override
  TopCircleState clone() {
    return TopCircleState(args);
  }
}

TopCircleState initState(Map<String, dynamic> args) {
  return TopCircleState(args);
}
