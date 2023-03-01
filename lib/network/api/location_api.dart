import 'package:dio/dio.dart';

import '../../network/api/api_client.dart';
import '../../constants/api_end_points.dart';

class LocationAPI {
  final APIClient _apiClient;

  LocationAPI({required APIClient apiClient}) : _apiClient = apiClient;

  Future<Response> searchLocationApi(String searchString) async {
    try {
      print("In api, location is $searchString");
      final Response response = await _apiClient.get(
        endpoint: APIEndPoints.searchPlaceByName,
        queryParams: {"q": searchString},
      );
      return response;
    } catch (error) {
      print("Error from location API ${error}");
      rethrow;
    }
  }
}
