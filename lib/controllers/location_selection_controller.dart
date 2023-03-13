import '../utils/screen_imports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/settings/settings_bloc.dart';
import '../blocs/weather/weather_bloc.dart';
import '../services/preferences.dart';
import '../network/repository/location_repository.dart';
import '../utils/service_locator.dart';
import '../models/place/place.dart';

class LocationSelectionController {
  // controllers
  final searchEditingController = TextEditingController();

  final preferences = getItInstance.get<Preferences>();
  LocationRepository locationRepository =
      getItInstance.get<LocationRepository>();
  WeatherBloc weatherBloc = WeatherBloc();

  Future<List<Place>> placeVerificationHandler() async {
    try {
      final location = await locationRepository.checkForUserLocation(
        placeName: searchEditingController.text,
      );

      return location;
    } catch (e) {
      rethrow;
    }
  }

  bool showEmptyComponent({required bool loading, List<Place>? placeList}) {
    return loading || placeList == null || placeList!.isEmpty;
  }

  void confirmSelectedLocation({
    required Place selPlace,
    required BuildContext context,
  }) {
    //
    void onPlaceConfirmed(BuildContext modalContext) {
      BlocProvider.of<SettingsBloc>(context).add(
        SaveSelPlace(selPlace: selPlace),
      );
      BlocProvider.of<WeatherBloc>(context).add(
        GetCurrentWeatherEvent(selectedPlace: selPlace),
      );
      Navigator.of(modalContext).pop();
      Navigator.of(context).pop();
    }

    showDialog(
      context: context,
      builder: (modalContext) {
        return AlertDialog(
          title: Text(selPlace.name!),
          content: Text(AppLocalizations.of(context)!.selectPlaceMessage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(modalContext).pop();
              },
              child: Text(AppLocalizations.of(context)!.no),
            ),
            TextButton(
              onPressed: (() => onPlaceConfirmed(modalContext)),
              child: Text(AppLocalizations.of(context)!.yes),
            ),
          ],
        );
      },
    );
  }
}
