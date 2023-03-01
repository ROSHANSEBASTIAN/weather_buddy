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

// callbacks

  Future<Place> checkForLocation({required BuildContext context}) async {
    // first check for stored location
    Place place = await Preferences.getSelectedLocation();
    selPlace = place;

    print("Selected location is $selPlace");

    return selPlace!;
  }

  void submitHandler() {}

  String displayStringForOption(Place selPlace) {
    return selPlace.name ?? "Search for place";
  }
}
