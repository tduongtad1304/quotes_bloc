import 'dart:developer';

import 'package:bloc/bloc.dart';

class QuotesObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);

    log('${bloc.runtimeType} $change');
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);

    log('${bloc.runtimeType} created');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);

    log('${bloc.runtimeType} closed');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);

    log('${bloc.runtimeType} error: $error stacktrace: $stackTrace');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    log('${bloc.runtimeType} event: $event');

    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log('${bloc.runtimeType} transition: $transition');

    super.onTransition(bloc, transition);
  }
}
