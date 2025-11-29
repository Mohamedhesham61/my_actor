import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio;

  Dio get dio => _dio;

  DioClient(String baseUrl, String apiKey)
    : _dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          queryParameters: {"api_key": apiKey, "language": "en-US"},
          headers: {"Accept": "application/json"},
        ),
      ) {
    _dio.interceptors.add(LogInterceptor(request: true, requestBody: true, responseBody: true));
  }

  /// ------------------------------
  /// Generic GET Request
  /// ------------------------------
  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      throw Exception(_handleDioError(e));
    }
  }

  /// ------------------------------
  /// API Error Handler
  /// ------------------------------
  String _handleDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout) {
      return "Connection timeout";
    }
    if (e.type == DioExceptionType.receiveTimeout) {
      return "Receive timeout";
    }
    if (e.type == DioExceptionType.badResponse) {
      return "Server error: ${e.response?.statusCode}";
    }
    if (e.type == DioExceptionType.connectionError) {
      return "No internet connection";
    }
    return "Unexpected error: ${e.message}";
  }
}
