import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'current.dart';
import 'forecast.dart';
import 'location.dart';

part 'weather_forecast.g.dart';

@JsonSerializable()
class WeatherForecast extends Equatable {
  final Location? location;
  final Current? current;
  final Forecast? forecast;

  const WeatherForecast({this.location, this.current, this.forecast});

  factory WeatherForecast.fromJson(Map<String, dynamic> json) {
    return _$WeatherForecastFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WeatherForecastToJson(this);

  @override
  List<Object?> get props => [location, current, forecast];
}
