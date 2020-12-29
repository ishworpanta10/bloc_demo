import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_demo/presentation/constants/enums.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  StreamSubscription connectivityStreamSubscription;

  InternetCubit({this.connectivity}) : super(InternetLoading()) {
    monitorInternetCubit();
  }

  void monitorInternetCubit() {
     connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult == ConnectivityResult.wifi) {
        emitInternetConnected(ConnectionType.Wifi);
      } else if (connectivityResult == ConnectivityResult.mobile) {
        emitInternetConnected(ConnectionType.Mobile);
      } else if (connectivityResult == ConnectivityResult.none) {
        emitInternetDisconnected();
      }
    });
  }

  void emitInternetConnected(ConnectionType _connectionType) =>
      emit(InternetConnectedState(connectionType: _connectionType));

  void emitInternetDisconnected() => emit(InternetDisconnectedState());

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}
