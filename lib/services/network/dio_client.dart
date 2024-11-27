import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../constants/urls.dart';
import 'exceptions/network_exception.dart';
import 'dart:async';

import '../../utils/logger/log_tags.dart';
import '../../utils/logger/logger.dart';
import 'intercepters/logging_interceptor.dart';
import 'request/request_methods.dart';

part 'dio_client.g.dart';

@Riverpod(keepAlive: true)
class NetworkRequestHandlerNotifier extends _$NetworkRequestHandlerNotifier {
  late final Dio _dio;
  late final RequestRetrier _retrier;

  @override
  FutureOr<void> build() {
    _initializeDio();
    _retrier = RequestRetrier(_dio);
  }

  void _initializeDio() {
    _dio = Dio(
      BaseOptions(
        connectTimeout: DioConfig.connectTimeout,
        receiveTimeout: DioConfig.receiveTimeout,
        validateStatus: (status) => status != null && status < 500,
        baseUrl: APIUrls.menuURLProd,
      ),
    );

    _dio.interceptors.addAll([
      LoggingInterceptor(),
      InterceptorsWrapper(onError: _handleInterceptorError),
    ]);
  }

  Future<void> _handleInterceptorError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (_shouldRetry(err)) {
      try {
        return await _retry(err, handler);
      } catch (e) {
        debugLog(LogTags.network, 'Retry failed: $e');
      }
    }
    return handler.next(err);
  }

  Future<void> _retry(DioException err, ErrorInterceptorHandler handler) async {
    var retryCount = 0;

    while (retryCount < DioConfig.maxRetries) {
      try {
        retryCount++;
        final response = await _retrier.retry(err.requestOptions, retryCount);
        return handler.resolve(response);
      } on DioException catch (e) {
        if (retryCount >= DioConfig.maxRetries) rethrow;
        err = e;
      }
    }
  }

  Future<Either<Failure, Response>> getRequest({
    required NetworkRequest request,
    required String logTag,
    required String logMsg,
    CancelToken? cancelToken,
  }) async {
    debugLog(
        logTag, "Starting GET request to ${request.url}\nMessage: $logMsg");

    try {
      final response = await _performRequest(
        request: request,
        cancelToken: cancelToken,
      );

      if (!_validateResponse(response)) {
        throw NetworkException(
          message: 'Invalid response format',
          code: response.statusCode?.toString(),
          data: response.data,
        );
      }

      debugLog(logTag,
          "Request successful with status code: ${response.statusCode}");
      return Right(response);
    } on DioException catch (e, stackTrace) {
      debugLog(logTag, "DioException occurred: ${e.message}");
      final networkException = NetworkException.fromDioException(e)
        ..stackTrace = stackTrace;
      return Left(_createFailure(networkException));
    } on NetworkException catch (e) {
      return Left(_createFailure(e));
    } catch (e, stackTrace) {
      debugLog(logTag, "Unexpected error: $e");
      return Left(
        Failure(
          message: 'Unexpected error occurred',
          stackTrace: stackTrace,
          code: 'UNKNOWN_ERROR',
          data: e.toString(),
        ),
      );
    }
  }

  Future<Response> _performRequest({
    required NetworkRequest request,
    CancelToken? cancelToken,
  }) async {
    final options = Options(
      headers: request.headers,
      sendTimeout: request.sendTimeout,
      receiveTimeout: request.receiveTimeout,
    );

    return _dio.get(
      request.path ?? '',
      queryParameters: request.queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  bool _shouldRetry(DioException error) {
    return error.type == DioExceptionType.connectionError ||
        error.type == DioExceptionType.receiveTimeout ||
        (error.response?.statusCode ?? 0) >= 500;
  }

  Failure _createFailure(NetworkException exception) {
    return Failure(
      message: exception.message,
      code: exception.code,
      data: exception.data,
      stackTrace: exception.stackTrace,
      response: exception.response,
      isRetryable: _isRetryableError(exception.code),
    );
  }

  bool _isRetryableError(String? code) {
    if (code == null) return false;
    final numCode = int.tryParse(code);
    return (numCode != null && numCode >= 500) ||
        code == 'CONNECTION_ERROR' ||
        code == 'RECEIVE_TIMEOUT';
  }

  bool _validateResponse(Response response) {
    if (response.data == null) {
      debugLog(LogTags.responseError, 'Response data is null');
      return false;
    }

    final statusCode = response.statusCode ?? 0;
    if (statusCode < 200 || statusCode >= 300) {
      debugLog(LogTags.responseError, 'Invalid status code: $statusCode');
      return false;
    }

    return true;
  }
}

class DioConfig {
  static const Duration connectTimeout = Duration(seconds: 60);
  static const Duration receiveTimeout = Duration(seconds: 60);
  static const int maxRetries = 3;
  static const Duration initialRetryDelay = Duration(seconds: 1);
}

class RequestRetrier {
  final Dio dio;

  RequestRetrier(this.dio);

  Future<Response<T>> retry<T>(
    RequestOptions requestOptions,
    int retryCount,
  ) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );

    await Future.delayed(DioConfig.initialRetryDelay * retryCount);
    return dio.request<T>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}
