// ignore_for_file: avoid_print, depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class MyBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    logger.i('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    logger.i('onClose -- ${bloc.runtimeType}');
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    logger.i('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    logger.e('onError -- ${bloc.runtimeType}, $error');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    logger.i('onTransition -- ${bloc.runtimeType}, $transition');
  }
}
