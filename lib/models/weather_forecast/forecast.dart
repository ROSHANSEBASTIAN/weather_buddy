import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'forecastday.dart';

part 'forecast.g.dart';

@JsonSerializable()
class Forecast extends Equatable {
  final List<Forecastday>? forecastday;

  const Forecast({this.forecastday});

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return _$ForecastFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ForecastToJson(this);

  @override
  List<Object?> get props => [forecastday];
}
