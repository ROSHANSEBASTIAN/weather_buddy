import 'package:dio/dio.dart';

import '../../utils/config.dart';

class APIClient {
  final Dio _dio;
  final defaultOptions = Options(headers: {
    "X-RapidAPI-Key": Config.API_KEY,
    "X-RapidAPI-Host": Config.API_HOST,
  });

  APIClient(this._dio) {
    _dio.options.baseUrl = Config.BASE_URL;
    _dio.options.connectTimeout = Config.connectTimeout;
    _dio.options.receiveTimeout = Config.receiveTimeout;
    _dio.options.responseType = ResponseType.json;
  }

  Future<Response> get({
    required String endpoint,
    Map<String, dynamic>? queryParams,
    Options? options,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        endpoint,
        queryParameters: queryParams,
        options: defaultOptions,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (error) {
      print("Error from API client ${error}");
      rethrow;
    }
  }

  Future<Response> post({
    required String url,
    dynamic data,
    Map<String, dynamic>? queryParams,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        url,
        data: data,
        options: options,
        queryParameters: queryParams,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      );

      return response;
    } catch (error) {
      rethrow;
    }
  }
}
