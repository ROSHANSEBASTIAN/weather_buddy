import 'package:shared_preferences/shared_preferences.dart';

import '../models/place/place.dart';
import '../utils/config.dart';

class Preferences {
  // keys
  static const String _KEY_SEL_PLACE_ID = "_KEY_SEL_PLACE_ID";
  static const String _KEY_SEL_PLACE_NAME = "_KEY_SEL_PLACE_NAME";
  static const String _KEY_SEL_PLACE_LAT = "_KEY_SEL_PLACE_LAT";
  static const String _KEY_SEL_PLACE_LONG = "_KEY_SEL_PLACE_LONG";
  static const String _KEY_SEL_PLACE_REGION = "_KEY_SEL_PLACE_REGION";
  static const String _KEY_SEL_PLACE_COUNTRY = "_KEY_SEL_PLACE_COUNTRY";
  static const String _KEY_SEL_PLACE_URL = "_KEY_SEL_PLACE_URL";

// instance
  static Future<SharedPreferences> get _instance =>
      SharedPreferences.getInstance();

  // getters and setters

  // for selected location
  static Future<Place> getSelectedLocation() async {
    final SharedPreferences preferences = await _instance;

    final int id =
        preferences.getInt(_KEY_SEL_PLACE_ID) ?? Config.defaultPlace.id!;
    final String placeName =
        preferences.getString(_KEY_SEL_PLACE_NAME) ?? Config.defaultPlace.name!;
    final double lat =
        preferences.getDouble(_KEY_SEL_PLACE_LAT) ?? Config.defaultPlace.lat!;
    final double long =
        preferences.getDouble(_KEY_SEL_PLACE_LONG) ?? Config.defaultPlace.lon!;
    final String country = preferences.getString(_KEY_SEL_PLACE_COUNTRY) ??
        Config.defaultPlace.country!;
    final String region = preferences.getString(_KEY_SEL_PLACE_REGION) ??
        Config.defaultPlace.region!;
    final String url =
        preferences.getString(_KEY_SEL_PLACE_URL) ?? Config.defaultPlace.url!;

    final selPlace = Place(
      id: id,
      country: country,
      lat: lat,
      lon: long,
      name: placeName,
      region: region,
      url: url,
    );

    return selPlace;
  }

  static Future<void> setSelectedLocation(Place selPlace) async {
    final SharedPreferences preferences = await _instance;
    await preferences.setInt(_KEY_SEL_PLACE_ID, selPlace.id!);
    await preferences.setString(_KEY_SEL_PLACE_NAME, selPlace.name!);
    await preferences.setString(_KEY_SEL_PLACE_COUNTRY, selPlace.country!);
    await preferences.setString(_KEY_SEL_PLACE_URL, selPlace.url!);
    await preferences.setDouble(_KEY_SEL_PLACE_LAT, selPlace.lat!);
    await preferences.setDouble(_KEY_SEL_PLACE_LONG, selPlace.lon!);
    await preferences.setString(_KEY_SEL_PLACE_REGION, selPlace.region!);
  }
}
