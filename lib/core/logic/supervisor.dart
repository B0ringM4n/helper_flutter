import 'dart:developer';

import 'package:meta/meta.dart';

import 'get_bloc.dart';

class Transition<Event, State> {
  final State currentState;
  final Event event;
  final State nextState;

  Transition(
      {@required this.currentState,
      @required this.event,
      @required this.nextState});

  @override
  String toString() =>
      "Trasition: {currenState: $currentState, event: $event, nextState: $nextState}";
}

class Supervisor {
  /// imprecion para debug antes del proceso
  static void onEvent(GetBloc bloc, Object event) {
    log("===== Iniciando proceso =====", name: "Tonatlan");
    log(
      "|  bloc: ${bloc.runtimeType}, event: $event",
      name: "Tonatlan",
    );
  }

  /// imprecion para debug despues del proceso
  /// antes de asignar valores
  static void onTrasition(GetBloc bloc, Transition transition) {
    log("|  bloc: ${bloc.runtimeType}, $transition", name: "Tonatlan");
  }

  /// imprecion para debug antes del proceso
  static void onFinaly(GetBloc bloc, Object event) {
    log("|  bloc: ${bloc.runtimeType}, event: $event", name: "Tonatlan");
    log("===== Finalizando proceso =====", name: "Tonatlan");
  }

  /// imprecion para debug error en el proceso
  static void onError(GetBloc bloc, Object error, StackTrace stackTrace) {
    log("===== Error en Evento =====", name: "ErrorTonatlan");
    log(
      "|  bloc: ${bloc.runtimeType}",
      name: "ErrorTonatlan",
      error: error,
      stackTrace: stackTrace,
    );
  }
}
