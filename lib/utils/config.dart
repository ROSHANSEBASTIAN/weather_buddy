import 'package:weather_buddy/models/place/place.dart';

class Config {
  static const API_KEY = "5e16619622mshe363a376ee84437p12242djsne555642088ba";
  static const API_HOST = "weatherapi-com.p.rapidapi.com";
  static const BASE_URL = "https://weatherapi-com.p.rapidapi.com/";
  static const connectTimeout = Duration(seconds: 7);
  static const receiveTimeout = Duration(seconds: 7);
  static const defaultPlace = Place(
      country: "India",
      id: 1134737,
      lat: 8.51,
      lon: 76.96,
      name: "Thiruvananthapuram",
      region: "Kerala",
      url: "thiruvananthapuram-kerala-india");
}
