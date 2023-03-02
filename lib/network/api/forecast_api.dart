import 'package:dio/dio.dart';

import '../../network/api/api_client.dart';
import '../../constants/api_end_points.dart';

class ForecastAPI {
  final APIClient _apiClient;

  ForecastAPI({required APIClient apiClient}) : _apiClient = apiClient;

  Future<Response> searchForecastApi(
      {required String searchString, required int days}) async {
    try {
      print("For forecast api, location is $searchString");
      final Response response = await _apiClient.get(
        endpoint: APIEndPoints.weatherForecast,
        queryParams: {"q": searchString, "days": days.toString()},
      );
      return response;
    } catch (error) {
      print("Error from forecast API ${error}");
      rethrow;
    }
  }
}
