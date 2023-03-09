import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../network/repository/location_repository.dart';
import '../../utils/service_locator.dart';
import '../../models/place/place.dart';

part 'place_event.dart';
part 'place_state.dart';

class PlaceBloc extends Bloc<PlaceEvent, PlaceState> {
  final LocationRepository _repository =
      getItInstance.get<LocationRepository>();

  PlaceBloc() : super(const PlaceInitial()) {
    on<SearchPlaceEvent>((event, emit) async {
      emit(const PlaceListLoading());
      try {
        final placeList = await _repository.checkForUserLocation(
            placeName: event.searchString);
        emit(PlaceListLoadSuccess(placeList: placeList));
      } catch (error) {
        emit(PlaceListLoadError(error: error.toString()));
      }
    });
  }
}
