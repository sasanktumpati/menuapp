import 'package:dio/dio.dart';

class NetworkRequest {
  final String? url;
  final String? path;
  final Map<String, dynamic>? queryParameters;
  final Map<String, dynamic>? headers;
  final Duration? sendTimeout;
  final Duration? receiveTimeout;
  final Object? body;

  NetworkRequest({
    this.url,
    this.path,
    this.queryParameters,
    this.headers,
    this.sendTimeout,
    this.receiveTimeout,
    this.body,
  });
}

class Failure {
  final String message;
  final String? code;
  final dynamic data;
  final StackTrace? stackTrace;
  final Response? response;
  final bool isRetryable;

  const Failure({
    required this.message,
    this.code,
    this.data,
    this.stackTrace,
    this.response,
    this.isRetryable = false,
  });

  @override
  String toString() =>
      'Failure(message: $message, code: $code, isRetryable: $isRetryable)';
}
