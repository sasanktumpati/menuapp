class NetworkRequest {
  final String url;
  final String? path;
  final Map<String, dynamic>? queryParameters;
  final Map<String, dynamic>? headers;
  final Duration? sendTimeout;
  final Duration? receiveTimeout;
  final Object? body;

  NetworkRequest({
    required this.url,
    this.path,
    this.queryParameters,
    this.headers,
    this.sendTimeout,
    this.receiveTimeout,
    this.body,
  });
}
