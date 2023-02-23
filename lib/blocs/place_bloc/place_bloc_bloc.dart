import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_buddy/models/place/place.dart';

part 'place_bloc_event.dart';
part 'place_bloc_state.dart';

class PlaceBlocBloc extends Bloc<PlaceBlocEvent, PlaceBlocState> {
  PlaceBlocBloc() : super(PlaceBlocInitial(loading: false)) {
    on<PlaceBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
