import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum TopCircleAction { action }

class TopCircleActionCreator {
  static Action onAction() {
    return const Action(TopCircleAction.action);
  }
}
