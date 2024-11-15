class NetworkRequest {
  final String url;
  final String? path;
  final Map<String, dynamic>? queryParameters;
  final Map<String, dynamic>? headers;

  NetworkRequest({
    required this.url,
    this.path,
    this.queryParameters,
    this.headers,
  });
}
