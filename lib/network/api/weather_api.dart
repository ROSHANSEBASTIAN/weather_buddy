import 'package:dio/dio.dart';

import '../../network/api/api_client.dart';
import '../../constants/api_end_points.dart';

class WeatherAPI {
  final APIClient _apiClient;

  WeatherAPI({required APIClient apiClient}) : _apiClient = apiClient;

  Future<Response> searchCurrentWeatherApi(String searchString) async {
    try {
      print("In api, search string is $searchString");
      final Response response = await _apiClient.get(
        endpoint: APIEndPoints.currentWeather,
        queryParams: {"q": searchString},
      );
      return response;
    } catch (error) {
      print("Error from current weather API ${error}");
      rethrow;
    }
  }
}
