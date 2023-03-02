part of 'forecast_bloc.dart';

abstract class ForecastState extends Equatable {
  const ForecastState();

  @override
  List<Object> get props => [];
}

class ForecastInitial extends ForecastState {
  final bool loading;
  const ForecastInitial() : loading = false;
}

class ForecastDataLoading extends ForecastState {
  final bool loading;
  const ForecastDataLoading() : loading = true;

  @override
  List<Object> get props => [loading];
}

class ForecastDataLoaded extends ForecastState {
  final bool loading;
  final WeatherForecast forecast;
  const ForecastDataLoaded({required this.forecast}) : loading = false;

  @override
  List<Object> get props => [loading, forecast];
}

class ForecastDataLoadError extends ForecastState {
  final bool loading;
  final String error;
  const ForecastDataLoadError({required this.error}) : loading = false;

  @override
  List<Object> get props => [loading, error];
}
