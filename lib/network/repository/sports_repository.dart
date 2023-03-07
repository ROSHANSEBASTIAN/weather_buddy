import 'package:dio/dio.dart';
import 'package:weather_buddy/models/place/place.dart';
import 'package:weather_buddy/models/sports/sports.dart';
import 'package:weather_buddy/network/api/sports_api.dart';
import 'package:weather_buddy/network/api_exception.dart';
import 'package:weather_buddy/utils/log.dart';

class SportsRepository {
  final SportsAPI sportsAPI;

  SportsRepository({required this.sportsAPI});

  Future<Sports> getSportsEventsFromAPI(Place place) async {
    final String searchString = "${place.country}";
    try {
      final apiResp = await sportsAPI.getSportsEvents(
        searchString: searchString,
      );
      final sportsInfo = Sports.fromJson(apiResp.data);
      Log.sportsLog("sportsInfo from API ${apiResp}");
      return sportsInfo;
    } on DioError catch (error) {
      final errorMessage = APIExceptions.fromError(error).toString();
      throw errorMessage;
    }
  }
}
