part of 'forecast_bloc.dart';

abstract class ForecastEvent extends Equatable {
  const ForecastEvent();

  @override
  List<Object> get props => [];
}

class GetWeatherForecastEvent extends ForecastEvent {
  Place selPlace;
  GetWeatherForecastEvent({required this.selPlace});
}
