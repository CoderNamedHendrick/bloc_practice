import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> with HydratedMixin {
  // final InternetCubit internetCubit;
  // late StreamSubscription internetStreamSubscription;
  CounterCubit() : super(CounterState(counterValue: 0)) {
    // monitorInternetCubit();
  }

  // void monitorInternetCubit() {
  //   internetStreamSubscription = internetCubit.stream.listen((event) {
  //     if (event is InternetConnected &&
  //         event.connectionType == ConnectionType.Wifi) {
  //       increment();
  //     } else if (event is InternetConnected &&
  //         event.connectionType == ConnectionType.Mobile) {
  //       decrement();
  //     }
  //   });
  // }

  void increment() => emit(
        CounterState(
            counterValue: state.counterValue + 1, wasIncremented: true),
      );

  void decrement() => emit(
        CounterState(
            counterValue: state.counterValue - 1, wasIncremented: false),
      );

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    // addError(Exception("Couldn't write to storage!"), StackTrace.current);
    return CounterState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    return state.toMap();
  }
}
