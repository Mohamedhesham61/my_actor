import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'no_internet_event.dart';
import 'no_internet_state.dart';


class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? _subscription;

  ConnectivityBloc() : super(ConnectivityOnline()) {
    on<ConnectivityChanged>((event, emit) {
      if (event.isConnected) {
        emit(ConnectivityOnline());
      } else {
        emit(ConnectivityOffline());
      }
    });

    _checkInitialConnection();
    StreamSubscription<List<ConnectivityResult>>? subscription;

    _connectivity.onConnectivityChanged.listen((results) {
      final isConnected = results.any((result) => result != ConnectivityResult.none);
      add(ConnectivityChanged(isConnected));
    });
  }

  Future<void> _checkInitialConnection() async {
    final result = await _connectivity.checkConnectivity();
    add(ConnectivityChanged(result[0] != ConnectivityResult.none));
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
