import 'package:shared_preferences/shared_preferences.dart';

import 'package:weather_buddy/models/Location.dart';

class Preferences {
  // keys
  static const String _KEY_SEL_LOCATION_LAT = "SEL_LOCATION_LAT";
  static const String _KEY_SEL_LOCATION_LONG = "SEL_LOCATION_LONG";
  static const String _KEY_SEL_LOCATION_PLACE = "SEL_LOCATION_PLACE";

// instance
  static Future<SharedPreferences> get _instance =>
      SharedPreferences.getInstance();

  // getters and setters

  // for selected location
  static Future<Location> getSelectedLocation() async {
    final SharedPreferences preferences = await _instance;
    final selLocation = Location();
    selLocation.lat = preferences.getString(_KEY_SEL_LOCATION_LAT);
    selLocation.long = preferences.getString(_KEY_SEL_LOCATION_LONG);
    selLocation.place = preferences.getString(_KEY_SEL_LOCATION_PLACE);
    if ((selLocation.lat != null && selLocation.long != null) ||
        selLocation.place != null) {
      selLocation.isAValidLocation = true;
    }
    return selLocation;
  }

  static Future<void> setSelectedLocation(Location selLocation) async {
    final SharedPreferences preferences = await _instance;
    await preferences.setString(_KEY_SEL_LOCATION_LAT, selLocation.lat!);
    await preferences.setString(_KEY_SEL_LOCATION_LONG, selLocation.long!);
    await preferences.setString(_KEY_SEL_LOCATION_PLACE, selLocation.place!);
  }
}
