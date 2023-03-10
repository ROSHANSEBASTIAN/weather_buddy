import 'package:dio/dio.dart';

import '../../models/astro_info/astro_info.dart';
import '../../network/api/astronomy_api.dart';
import '../../network/api_exception.dart';
import '../../models/place/place.dart';

class AstronomyRepository {
  final AstronomyAPI astronomyAPI;

  AstronomyRepository({required this.astronomyAPI});

  Future<AstroInfo> getAstroInfo({
    required Place place,
  }) async {
    try {
      String searchString = "${place.lat},${place.lon}";
      final response =
          await astronomyAPI.searchAstronomyInfoApi(searchString: searchString);
      final astroInfo = AstroInfo.fromJson(response.data);

      return astroInfo;
    } on DioError catch (e) {
      final errorMessage = APIExceptions.fromError(e).toString();
      throw errorMessage;
    }
  }
}
