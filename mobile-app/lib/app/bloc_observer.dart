import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/cores.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    Console.log('onEvent ', '${bloc.runtimeType}, $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    Console.log('onChange', change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    Console.log(
        'onTransition',
        '${transition.currentState.toString()} ===>>> ${transition.nextState.toString()}'
            '');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    Console.log('onError', '${bloc.runtimeType}, $error, $stackTrace');
  }
}
