import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<TopCircleState> buildReducer() {
  return asReducer(
    <Object, Reducer<TopCircleState>>{
      TopCircleAction.action: _onAction,
    },
  );
}

TopCircleState _onAction(TopCircleState state, Action action) {
  final TopCircleState newState = state.clone();
  return newState;
}
