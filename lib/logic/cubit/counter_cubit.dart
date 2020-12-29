import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_demo/logic/cubit/internet_cubit.dart';
import 'package:bloc_demo/presentation/constants/enums.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;

  StreamSubscription internetStreamSubscription;

  CounterCubit({@required this.internetCubit})
      : super(CounterState(counterValue: 0)) {
    monitorInternetSubscription();
  }

  void monitorInternetSubscription() {
     internetStreamSubscription = internetCubit.listen((internetState) {
      if (internetState is InternetConnectedState &&
          internetState.connectionType == ConnectionType.Wifi) {
        increment();
      } else if (internetState is InternetConnectedState &&
          internetState.connectionType == ConnectionType.Mobile) {
        decrement();
      }
    });
  }

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, isIncrement: true));
  void decrement() => emit(
      CounterState(counterValue: state.counterValue - 1, isIncrement: false));

  @override
  Future<void> close() {
    internetStreamSubscription.cancel();
    return super.close();
  }
}
