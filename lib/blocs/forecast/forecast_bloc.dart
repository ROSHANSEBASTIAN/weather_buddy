import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../network/repository/forecast_repository.dart';
import '../../utils/log.dart';
import '../../utils/service_locator.dart';
import '../../models/place/place.dart';
import '../../models/weather_forecast/weather_forecast.dart';

part 'forecast_event.dart';
part 'forecast_state.dart';

class ForecastBloc extends Bloc<ForecastEvent, ForecastState> {
  final ForecastRepository _repository =
      getItInstance.get<ForecastRepository>();

  ForecastBloc() : super(const ForecastInitial()) {
    on<GetWeatherForecastEvent>((event, emit) async {
      Log.forecastLog("Working on fetching forecast info");
      emit(const ForecastDataLoading());
      try {
        final forecastInfo = await _repository.searchForWeatherForecast(
          place: event.selPlace,
        );
        emit(ForecastDataLoaded(forecast: forecastInfo));
      } catch (error) {
        Log.forecastLog("Error while fetching forecast $error");
        emit(ForecastDataLoadError(error: error.toString()));
      }
    });
  }
}
