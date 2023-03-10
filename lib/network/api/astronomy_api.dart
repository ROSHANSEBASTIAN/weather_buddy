import 'package:dio/dio.dart';
import 'package:weather_buddy/utils/log.dart';

import '../../network/api/api_client.dart';
import '../../constants/api_end_points.dart';

class AstronomyAPI {
  final APIClient _apiClient;

  AstronomyAPI({required APIClient apiClient}) : _apiClient = apiClient;

  Future<Response> searchAstronomyInfoApi(
      {required String searchString}) async {
    try {
      Log.astroLog("For Astronomy api, location is $searchString");
      final Response response = await _apiClient.get(
        endpoint: APIEndPoints.astronomyInfo,
        queryParams: {"q": searchString},
      );
      Log.astroLog("API response is $response");
      return response;
    } catch (error) {
      Log.astroLog("Error from Astronomy API ${error}");
      rethrow;
    }
  }
}
