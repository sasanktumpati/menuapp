import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/logger/log_tags.dart';
import '../../utils/logger/logger.dart';
import 'request/request_methods.dart';

final networkProvider = Provider<NetworkRequestHandler>((ref) {
  return NetworkRequestHandler();
});

class NetworkRequestHandler {
  final Dio _dio;

  NetworkRequestHandler({Dio? dio})
      : _dio = dio ??
            Dio(
              BaseOptions(
                connectTimeout: const Duration(seconds: 60),
                receiveTimeout: const Duration(seconds: 60),
              ),
            );

  Future<Either<Failure, T>> getRequest<T>({
    required NetworkRequest request,
    required String logTag,
    required String logmsg,
    T Function(dynamic data)? fromJson,
    CancelToken? cancelToken,
  }) async {
    debugLog(
      logTag,
      "Starting GET request to ${request.url}\nMessage: $logmsg",
    );
    final options = Options(headers: request.headers);

    try {
      final response = await _dio.get(
        request.url,
        queryParameters: request.queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      debugLog(LogTags.getMenu, "${response.statusCode}");

      if (!_validateResponse(response)) {
        return Left(
          Failure(
            message: 'Invalid response format',
            code: response.statusCode,
            data: response.data,
          ),
        );
      }

      final data = jsonDecode(response.data);

      debugLog(
        logTag,
        "Request successful with status code: ${response.statusCode}",
      );
      return Right(data);
    } on DioException catch (e) {
      debugLog(logTag, "DioException occurred: ${e.message}");
      return Left(_handleDioException(e));
    } catch (e, stackTrace) {
      debugLog(logTag, "Unexpected error: $e");
      return Left(
        Failure(
          message: 'Unexpected error: $e',
          stackTrace: stackTrace,
        ),
      );
    }
  }

  bool _validateResponse(Response response) {
    final statusCode = response.statusCode ?? 0;
    return statusCode >= 200 && statusCode < 300 && response.data != null;
  }

  Failure _handleDioException(DioException e) {
    final int? statusCode = e.response?.statusCode;
    final dynamic data = e.response?.data;

    String message;
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        message = 'Connection Timeout';
        break;
      case DioExceptionType.receiveTimeout:
        message = 'Receive Timeout';
        break;
      case DioExceptionType.sendTimeout:
        message = 'Send Timeout';
        break;
      case DioExceptionType.badResponse:
        message = 'Bad Response: ${statusCode ?? 'Unknown status code'}';
        break;
      case DioExceptionType.cancel:
        message = 'Request Cancelled';
        break;
      case DioExceptionType.badCertificate:
        message = 'Bad Certificate';
        break;
      case DioExceptionType.connectionError:
        message = 'Connection Error';
        break;
      case DioExceptionType.unknown:
      default:
        message = 'Unknown Error';
        break;
    }
    return Failure(
      message: message,
      code: statusCode,
      data: data,
    );
  }
}

class Failure {
  final String message;
  final int? code;
  final dynamic data;
  final StackTrace? stackTrace;

  Failure({
    required this.message,
    this.code,
    this.data,
    this.stackTrace,
  });
}
