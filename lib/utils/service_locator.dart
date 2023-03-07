import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../network/api/forecast_api.dart';
import '../network/api/sports_api.dart';
import '../network/api/weather_api.dart';
import '../network/api/api_client.dart';
import '../network/api/location_api.dart';
import '../network/repository/forecast_repository.dart';
import '../network/repository/sports_repository.dart';
import '../network/repository/weather_repository.dart';
import '../network/repository/location_repository.dart';
import '../services/preferences.dart';

final GetIt getItInstance = GetIt.instance;

Future<void> setupLocator() async {
  getItInstance.registerSingleton(Preferences());
  getItInstance.registerSingleton(Dio());

  // API client
  getItInstance.registerSingleton(APIClient(getItInstance<Dio>()));

  // APIs
  getItInstance.registerSingleton(
    LocationAPI(apiClient: getItInstance<APIClient>()),
  );
  getItInstance.registerSingleton(WeatherAPI(
    apiClient: getItInstance<APIClient>(),
  ));
  getItInstance.registerSingleton(ForecastAPI(
    apiClient: getItInstance<APIClient>(),
  ));
  getItInstance.registerSingleton(SportsAPI(
    apiClient: getItInstance<APIClient>(),
  ));

  // Repositories
  getItInstance.registerSingleton(
    LocationRepository(locationAPI: getItInstance.get<LocationAPI>()),
  );
  getItInstance.registerSingleton(
    WeatherRepository(weatherAPI: getItInstance.get<WeatherAPI>()),
  );
  getItInstance.registerSingleton(
    ForecastRepository(forecastAPI: getItInstance.get<ForecastAPI>()),
  );
  getItInstance.registerSingleton(
    SportsRepository(sportsAPI: getItInstance.get<SportsAPI>()),
  );
}
