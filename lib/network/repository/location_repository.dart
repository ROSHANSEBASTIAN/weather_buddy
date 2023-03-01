import 'package:dio/dio.dart';

import '../../network/api_exception.dart';
import '../../network/api/location_api.dart';
import '../../models/place/place.dart';

class LocationRepository {
  final LocationAPI locationAPI;

  LocationRepository({required this.locationAPI});

  Future<List<Place>> checkForUserLocation({
    required String placeName,
    String? lat,
    String? long,
  }) async {
    try {
      print("received place name is $placeName");
      final response = await locationAPI.searchLocationApi(placeName);
      final placesList =
          (response.data as List).map((e) => Place.fromJson(e)).toList();

      return placesList;
    } on DioError catch (e) {
      final errorMessage = APIExceptions.fromError(e).toString();
      throw errorMessage;
    }
  }
}
