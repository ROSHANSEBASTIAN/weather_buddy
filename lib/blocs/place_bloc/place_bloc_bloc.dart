import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_buddy/utils/screen_imports.dart';

import '../../models/place/place.dart';
import '../../utils/config.dart';

part 'place_bloc_event.dart';
part 'place_bloc_state.dart';

class PlaceBlocBloc extends Bloc<PlaceBlocEvent, PlaceBlocState> {
  //
  PlaceBlocBloc() : super(PlaceBlocInitial()) {
    //
    on<SaveSelectedPlace>((event, emit) {
      Place selPlace = state.selPlace; // previously selected place
      selPlace = event.selPlace;
      print("Saving new place to bloc $selPlace");
      return emit(PlaceBlocState(selPlace: selPlace));
    });
  }
}
