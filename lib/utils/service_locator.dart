import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_buddy/network/api/weather_api.dart';
import 'package:weather_buddy/network/repository/weather_repository.dart';

import '../network/repository/location_repository.dart';
import '../services/preferences.dart';
import '../network/api/api_client.dart';
import '../network/api/location_api.dart';

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

  // Repositories
  getItInstance.registerSingleton(
    LocationRepository(locationAPI: getItInstance.get<LocationAPI>()),
  );
  getItInstance.registerSingleton(
    WeatherRepository(weatherAPI: getItInstance.get<WeatherAPI>()),
  );
}
