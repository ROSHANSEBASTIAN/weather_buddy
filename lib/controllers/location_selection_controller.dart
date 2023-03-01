import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_buddy/blocs/place_bloc/place_bloc_bloc.dart';
import 'package:weather_buddy/services/preferences.dart';
import 'package:weather_buddy/utils/screen_imports.dart';

import '../network/repository/location_repository.dart';
import '../utils/service_locator.dart';
import '../models/place/place.dart';

class LocationSelectionController {
  // controllers
  final searchEditingController = TextEditingController();

  final preferences = getItInstance.get<Preferences>();
  LocationRepository locationRepository =
      getItInstance.get<LocationRepository>();

  Future<List<Place>> placeVerificationHandler() async {
    print("entered value is ${searchEditingController.text}");
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
      // await Preferences.setSelectedLocation(selPlace);
      print("Call reached controller $selPlace");
      BlocProvider.of<PlaceBlocBloc>(context).add(
        SaveSelectedPlace(selPlace: selPlace),
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
