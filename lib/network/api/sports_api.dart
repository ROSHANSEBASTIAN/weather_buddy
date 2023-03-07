import 'package:dio/dio.dart';

import '../../constants/api_end_points.dart';
import '../../network/api/api_client.dart';

class SportsAPI {
  final APIClient apiClient;

  SportsAPI({required this.apiClient});

  Future<Response> getSportsEvents({required String searchString}) async {
    try {
      final Response response = await apiClient.get(
        endpoint: APIEndPoints.sportsEvents,
        queryParams: {"q": searchString},
      );

      return response;
    } catch (error) {
      rethrow;
    }
  }
}
