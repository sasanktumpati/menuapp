import 'package:dio/dio.dart';

import '../../../utils/logger/log_tags.dart';
import '../../../utils/logger/logger.dart';

class LoggingInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugLog(
        LogTags.networkRequest,
        'Request: ${options.method} ${options.uri}\n'
        'Headers: ${options.headers}\n'
        'Data: ${options.data}');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugLog(
        LogTags.networkResponse,
        'Response [${response.statusCode}]: ${response.requestOptions.uri}\n'
        'Data: ${response.data}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugLog(
        LogTags.exception,
        'Error: ${err.type} ${err.message}\n'
        'URL: ${err.requestOptions.uri}');
    handler.next(err);
  }
}
