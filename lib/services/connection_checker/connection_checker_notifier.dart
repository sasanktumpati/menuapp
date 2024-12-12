import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:menuapp/constants/urls.dart';

import '../../utils/logger/log_tags.dart';
import '../../utils/logger/logger.dart';
import '../network/dio_client.dart';
import '../network/request/request_methods.dart';
import 'connection_checker_state.dart';

class ConnectionCheckerNotifier extends StateNotifier<ConnectionCheckerState> {
  final NetworkRequestHandlerNotifier networkRequestHandler;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  Timer? _debounceTimer;

  ConnectionCheckerNotifier({
    required Connectivity connectivity,
    required this.networkRequestHandler,
  }) : super(ConnectionCheckerState(isConnected: false, isLoading: true)) {
    _initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((results) {
      _debounceTimer?.cancel();
      _debounceTimer = Timer(const Duration(milliseconds: 200), () async {
        await _updateConnectionStatus(results);
      });
    });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    _debounceTimer?.cancel();
    super.dispose();
  }

  Future<void> _initConnectivity() async {
    try {
      checkConnection();
      _connectivitySubscription = _connectivity.onConnectivityChanged
          .listen((List<ConnectivityResult> results) {
        _debounceTimer?.cancel();
        _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
          await _updateConnectionStatus(results);
        });
      });
    } catch (e) {
      debugLog(
          LogTags.connectionChecker, 'Failed to initialize connectivity: $e');
      setConnectionStatus(false);
    }
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> results) async {
    if (results.isNotEmpty && !results.contains(ConnectivityResult.none)) {
      await checkConnection();
    } else {
      setConnectionStatus(false);
    }
  }

  void setConnectionResults(List<ConnectivityResult> results) {
    if (mounted) {
      state = state.copyWith(connectionStatus: results);
      debugLog(
          LogTags.connectionChecker, 'Connection results set to: $results');
    }
  }

  void setConnectionStatus(
    bool isConnected,
  ) {
    if (mounted) {
      state = state.copyWith(isConnected: isConnected);
      debugLog(
          LogTags.connectionChecker, 'Connection status set to: $isConnected');
    }
  }

  void setLoadingStatus(bool isLoading) {
    if (mounted) {
      state = state.copyWith(isLoading: isLoading);
      debugLog(LogTags.connectionChecker, 'Loading status set to: $isLoading');
    }
  }

  Future<void> checkConnection() async {
    if (!mounted) return;

    const timeoutDuration = Duration(seconds: 5);
    final request = NetworkRequest(
      path: APIUrls.menuURLDev,
      sendTimeout: timeoutDuration,
      receiveTimeout: timeoutDuration,
    );

    try {
      setLoadingStatus(true);

      final result = await networkRequestHandler.getRequest(
        request: request,
        logTag: LogTags.connectionChecker,
        logMsg: "Checking connection status",
      );

      return result.fold(
        (failure) {
          debugLog(
            LogTags.connectionChecker,
            'Connection check failed: ${failure.message}',
          );
          return _handleConnectionFailure();
        },
        (response) => _handleConnectionResponse(response),
      );
    } catch (e, stackTrace) {
      debugLog(
        LogTags.connectionChecker,
        'Connection check failed with exception: $e\n$stackTrace',
      );
      return _handleConnectionFailure();
    } finally {
      setLoadingStatus(false);
    }
  }

  void _handleConnectionResponse(Response response) {
    final isSuccessful =
        (response.statusCode ?? 0) >= 200 && (response.statusCode ?? 0) < 300;

    if (isSuccessful) {
      debugLog(LogTags.connectionChecker, 'Connection check successful');
      setConnectionStatus(true);
    } else {
      debugLog(
        LogTags.connectionChecker,
        'Connection check failed with status code: ${response.statusCode}',
      );
      setConnectionStatus(false);
    }
  }

  void _handleConnectionFailure() {
    setConnectionStatus(false);
  }
}

final connectionCheckerNotifierProvider =
    StateNotifierProvider<ConnectionCheckerNotifier, ConnectionCheckerState>(
        (ref) {
  final networkHandler =
      ref.read(networkRequestHandlerNotifierProvider.notifier);

  return ConnectionCheckerNotifier(
    networkRequestHandler: networkHandler,
    connectivity: Connectivity(),
  );
});
