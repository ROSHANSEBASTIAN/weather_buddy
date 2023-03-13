import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/place/place.dart';
import '../../models/sports/sports.dart';
import '../../network/repository/sports_repository.dart';
import '../../utils/service_locator.dart';

part 'sports_event.dart';
part 'sports_state.dart';

class SportsBloc extends Bloc<SportsEvent, SportsState> {
  final SportsRepository repository = getItInstance.get<SportsRepository>();

  SportsBloc() : super(const SportsInitial()) {
    on<GetSportsEvents>((event, emit) async {
      emit(const SportsDataLoading());
      try {
        final sportsInfo =
            await repository.getSportsEventsFromAPI(event.selPlace);
        emit(SportsDataLoaded(sportsInfo: sportsInfo));
      } catch (error) {
        emit(SportsDataLoadError(error: error.toString()));
      }
    });
  }
}
