import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_buddy/models/astro_info/astro_info.dart';
import '../../models/place/place.dart';
import '../../network/repository/astronomy_repository.dart';
import '../../utils/service_locator.dart';

part 'astronomy_event.dart';
part 'astronomy_state.dart';

class AstronomyBloc extends Bloc<AstronomyEvent, AstronomyState> {
  final AstronomyRepository _repository =
      getItInstance.get<AstronomyRepository>();

  AstronomyBloc() : super(const AstronomyInitial()) {
    on<GetAstronomyInfo>((event, emit) async {
      emit(const AstronomyInfoLoading());
      try {
        final astroInfo = await _repository.getAstroInfo(place: event.selPlace);
        emit(AstronomyInfoLoadSuccess(astroInfo: astroInfo));
      } catch (error) {
        emit(AstronomyInfoLoadError(error: error.toString()));
      }
    });
  }
}
