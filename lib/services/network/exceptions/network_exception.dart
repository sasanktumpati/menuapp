import 'package:dio/dio.dart';

class NetworkException implements Exception {
  final String message;
  final String? code;
  final dynamic data;
  StackTrace? _stackTrace;
  final Response? response;

  NetworkException({
    required this.message,
    this.code,
    this.data,
    StackTrace? stackTrace,
    this.response,
  }) : _stackTrace = stackTrace;

  set stackTrace(StackTrace? trace) => _stackTrace = trace;
  StackTrace? get stackTrace => _stackTrace;

  factory NetworkException.fromDioException(DioException e) {
    return NetworkException(
      message: _getErrorMessage(e),
      code: _getErrorCode(e),
      data: e.response?.data,
      response: e.response,
      stackTrace: e.stackTrace,
    );
  }

  static String _getErrorMessage(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timed out';
      case DioExceptionType.receiveTimeout:
        return 'Receive timeout occurred';
      case DioExceptionType.sendTimeout:
        return 'Send timeout occurred';
      case DioExceptionType.badResponse:
        return _getMessageFromStatusCode(e.response?.statusCode);
      case DioExceptionType.cancel:
        return 'Request was cancelled';
      case DioExceptionType.connectionError:
        return 'No internet connection';
      case DioExceptionType.badCertificate:
        return 'Invalid certificate';
      default:
        return 'An unexpected error occurred';
    }
  }

  static String _getErrorCode(DioException e) {
    if (e.type == DioExceptionType.badResponse) {
      return e.response?.statusCode?.toString() ?? 'UNKNOWN_STATUS';
    }
    return e.type.name.toUpperCase();
  }

  static String _getMessageFromStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return 'Not found';
      case 500:
        return 'Internal server error';
      case 502:
        return 'Bad gateway';
      case 503:
        return 'Service unavailable';
      default:
        return 'Something went wrong';
    }
  }
}
