part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {
  const WeatherInitial();
}

class WeatherDataLoading extends WeatherState {
  final bool loading;
  const WeatherDataLoading() : loading = true;

  @override
  List<Object> get props => [loading];
}

class WeatherDataLoaded extends WeatherState {
  final bool loading;
  final Weather currentWeather;

  const WeatherDataLoaded({
    required this.currentWeather,
  }) : loading = false;

  @override
  List<Object> get props => [currentWeather];
}

class WeatherDataLoadError extends WeatherState {
  final bool loading;
  final String error;

  const WeatherDataLoadError({required this.error}) : loading = false;

  @override
  List<Object> get props => [error];
}
