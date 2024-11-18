import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionCheckerState {
  final bool isLoading;
  final bool isConnected;
  List<ConnectivityResult> connectionStatus;

  ConnectionCheckerState(
      {this.isLoading = false,
      this.isConnected = false,
      List<ConnectivityResult>? connectionStatus})
      : connectionStatus = connectionStatus ?? [ConnectivityResult.none];

  ConnectionCheckerState copyWith(
      {bool? isLoading,
      bool? isConnected,
      List<ConnectivityResult>? connectionStatus}) {
    return ConnectionCheckerState(
      isLoading: isLoading ?? this.isLoading,
      isConnected: isConnected ?? this.isConnected,
      connectionStatus: connectionStatus,
    );
  }
}
