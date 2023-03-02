import 'package:dio/dio.dart';

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
      final response = await weatherAPI.searchCurrentWeatherApi(searchString);
      final weatherInfo = Weather.fromJson(response.data);
      return weatherInfo;
    } on DioError catch (e) {
      final errorMessage = APIExceptions.fromError(e).toString();
      throw errorMessage;
    }
  }
}
