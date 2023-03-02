import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'current.dart';
import 'location.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather extends Equatable {
  final Location? location;
  final Current? current;

  const Weather({this.location, this.current});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return _$WeatherFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  @override
  List<Object?> get props => [location, current];
}
