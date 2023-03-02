import 'package:weather_buddy/models/weather/weather.dart';
import 'package:weather_buddy/network/repository/weather_repository.dart';

import '../models/place/place.dart';
import '../utils/screen_imports.dart';
import '../services/preferences.dart';
import '../utils/service_locator.dart';
import '../network/repository/location_repository.dart';

class HomeController {
  // local variables
  Place? selPlace;
  // textInputControllers
  final placeNameController = TextEditingController();
  final latController = TextEditingController();
  final longController = TextEditingController();
  final preferences = getItInstance.get<Preferences>();
  LocationRepository locationRepository =
      getItInstance.get<LocationRepository>();
  WeatherRepository weatherRepository = getItInstance.get<WeatherRepository>();

// callbacks

  Future<Place> checkForLocation({required BuildContext context}) async {
    // first check for stored location
    Place place = await Preferences.getSelectedLocation();
    selPlace = place;

    return selPlace!;
  }

  Future<Weather> getCurrentWeatherInfo({required Place selPlace}) async {
    final weatherInfo =
        await weatherRepository.checkForCurrentWeather(place: selPlace);

    return weatherInfo;
  }
}
