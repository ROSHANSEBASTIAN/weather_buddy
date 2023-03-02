import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'astro.dart';
import 'day.dart';
import 'hour.dart';

part 'forecastday.g.dart';

@JsonSerializable()
class Forecastday extends Equatable {
  final String? date;
  @JsonKey(name: 'date_epoch')
  final int? dateEpoch;
  final Day? day;
  final Astro? astro;
  final List<Hour>? hour;

  const Forecastday({
    this.date,
    this.dateEpoch,
    this.day,
    this.astro,
    this.hour,
  });

  factory Forecastday.fromJson(Map<String, dynamic> json) {
    return _$ForecastdayFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ForecastdayToJson(this);

  @override
  List<Object?> get props => [date, dateEpoch, day, astro, hour];
}
