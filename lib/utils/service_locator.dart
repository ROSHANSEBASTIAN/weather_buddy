import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../network/repository/location_repository.dart';
import '../services/preferences.dart';
import '../network/api/api_client.dart';
import '../network/api/location_api.dart';

final GetIt getItInstance = GetIt.instance;

Future<void> setupLocator() async {
  getItInstance.registerSingleton(Preferences());
  getItInstance.registerSingleton(Dio());
  getItInstance.registerSingleton(APIClient(getItInstance<Dio>()));
  getItInstance
      .registerSingleton(LocationAPI(apiClient: getItInstance<APIClient>()));
  getItInstance.registerSingleton(
      LocationRepository(locationAPI: getItInstance.get<LocationAPI>()));
}
