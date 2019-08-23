import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<TopCircleState> buildEffect() {
  return combineEffects(<Object, Effect<TopCircleState>>{
    TopCircleAction.action: _onAction,
  });
}

void _onAction(Action action, Context<TopCircleState> ctx) {
}
