import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_tut/constants/enums.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;

  late StreamSubscription connectivityStreamSubscription;

  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
    monitorInternetConnection();
  }

  void monitorInternetConnection() {
    connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.wifi) {
        emitInternetConnected(ConnectionType.Wifi);
      } else if (event == ConnectivityResult.mobile) {
        emitInternetConnected(ConnectionType.Mobile);
      } else {
        emitInternetDisconnected();
      }
    });
  }

  void emitInternetConnected(ConnectionType _connectionType) =>
      emit(InternetConnected(connectionType: _connectionType));

  void emitInternetDisconnected() => emit(InternetDisconnected());

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}
