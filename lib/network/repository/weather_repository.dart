import 'package:dio/dio.dart';
import 'package:weather_buddy/utils/log.dart';

import '../../models/place/place.dart';
import '../../network/api/weather_api.dart';
import '../../network/api_exception.dart';
import '../../models/weather/weather.dart';

class WeatherRepository {
  final WeatherAPI weatherAPI;

  WeatherRepository({required this.weatherAPI});

  Future<Weather> checkForCurrentWeather({
    required Place place,
  }) async {
    try {
      String searchString = "${place.lat},${place.lon}";
      Log.weatherLog("Search String is $searchString");
      final response = await weatherAPI.searchCurrentWeatherApi(searchString);
      Log.weatherLog("weatherInfo received back in repo ${response.data}");
      final weatherInfo = Weather.fromJson(response.data);
      Log.weatherLog("weatherInfo converted to object $weatherInfo");
      return weatherInfo;
    } on DioError catch (e) {
      final errorMessage = APIExceptions.fromError(e).toString();
      print("weatherInfo received. But error $errorMessage");
      throw errorMessage;
    }
  }
}
