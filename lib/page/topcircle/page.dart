import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class TopCirclePage extends Page<TopCircleState, Map<String, dynamic>> {
  TopCirclePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<TopCircleState>(
                adapter: null,
                slots: <String, Dependent<TopCircleState>>{
                }),
            middleware: <Middleware<TopCircleState>>[
            ],);

}
