import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_buddy/utils/log.dart';

import '../../models/place/place.dart';
import '../../models/weather/weather.dart';
import '../../network/repository/weather_repository.dart';
import '../../utils/service_locator.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository _repository = getItInstance.get<WeatherRepository>();

  WeatherBloc() : super(const WeatherInitial()) {
    on<GetCurrentWeatherEvent>((event, emit) async {
      emit(const WeatherDataLoading());
      try {
        Log.weatherLog("Fetching weather info");
        final weatherData = await _repository.checkForCurrentWeather(
          place: event.selectedPlace,
        );
        emit(WeatherDataLoaded(currentWeather: weatherData));
      } catch (error) {
        emit(WeatherDataLoadError(error: error.toString()));
      }
    });
  }
}
