import 'package:dio/dio.dart';

import '../../models/weather_forecast/weather_forecast.dart';
import '../../network/api/forecast_api.dart';
import '../../network/api_exception.dart';
import '../../models/place/place.dart';

class ForecastRepository {
  final ForecastAPI forecastAPI;

  ForecastRepository({required this.forecastAPI});

  Future<WeatherForecast> searchForWeatherForecast({
    required Place place,
  }) async {
    try {
      String searchString = "${place.lat},${place.lon}";
      final response = await forecastAPI.searchForecastApi(
          searchString: searchString, days: 4);
      final forecastInfo = WeatherForecast.fromJson(response.data);

      return forecastInfo;
    } on DioError catch (e) {
      final errorMessage = APIExceptions.fromError(e).toString();
      throw errorMessage;
    }
  }
}
