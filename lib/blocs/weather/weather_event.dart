part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class GetCurrentWeatherEvent extends WeatherEvent {
  final Place selectedPlace;
  const GetCurrentWeatherEvent({required this.selectedPlace});

  @override
  List<Object> get props => [selectedPlace];
}
