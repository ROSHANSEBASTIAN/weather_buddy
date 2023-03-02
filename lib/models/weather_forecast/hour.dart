import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'condition.dart';

part 'hour.g.dart';

@JsonSerializable()
class Hour extends Equatable {
  @JsonKey(name: 'time_epoch')
  final int? timeEpoch;
  final String? time;
  @JsonKey(name: 'temp_c')
  final double? tempC;
  @JsonKey(name: 'temp_f')
  final double? tempF;
  @JsonKey(name: 'is_day')
  final int? isDay;
  final Condition? condition;
  @JsonKey(name: 'wind_mph')
  final double? windMph;
  @JsonKey(name: 'wind_kph')
  final double? windKph;
  @JsonKey(name: 'wind_degree')
  final int? windDegree;
  @JsonKey(name: 'wind_dir')
  final String? windDir;
  @JsonKey(name: 'pressure_mb')
  final double? pressureMb;
  @JsonKey(name: 'pressure_in')
  final double? pressureIn;
  @JsonKey(name: 'precip_mm')
  final double? precipMm;
  @JsonKey(name: 'precip_in')
  final double? precipIn;
  final int? humidity;
  final int? cloud;
  @JsonKey(name: 'feelslike_c')
  final double? feelslikeC;
  @JsonKey(name: 'feelslike_f')
  final double? feelslikeF;
  @JsonKey(name: 'windchill_c')
  final double? windchillC;
  @JsonKey(name: 'windchill_f')
  final double? windchillF;
  @JsonKey(name: 'heatindex_c')
  final double? heatindexC;
  @JsonKey(name: 'heatindex_f')
  final double? heatindexF;
  @JsonKey(name: 'dewpoint_c')
  final double? dewpointC;
  @JsonKey(name: 'dewpoint_f')
  final double? dewpointF;
  @JsonKey(name: 'will_it_rain')
  final int? willItRain;
  @JsonKey(name: 'chance_of_rain')
  final int? chanceOfRain;
  @JsonKey(name: 'will_it_snow')
  final int? willItSnow;
  @JsonKey(name: 'chance_of_snow')
  final int? chanceOfSnow;
  @JsonKey(name: 'vis_km')
  final double? visKm;
  @JsonKey(name: 'vis_miles')
  final double? visMiles;
  @JsonKey(name: 'gust_mph')
  final double? gustMph;
  @JsonKey(name: 'gust_kph')
  final double? gustKph;
  final double? uv;

  const Hour({
    this.timeEpoch,
    this.time,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.windchillC,
    this.windchillF,
    this.heatindexC,
    this.heatindexF,
    this.dewpointC,
    this.dewpointF,
    this.willItRain,
    this.chanceOfRain,
    this.willItSnow,
    this.chanceOfSnow,
    this.visKm,
    this.visMiles,
    this.gustMph,
    this.gustKph,
    this.uv,
  });

  factory Hour.fromJson(Map<String, dynamic> json) => _$HourFromJson(json);

  Map<String, dynamic> toJson() => _$HourToJson(this);

  @override
  List<Object?> get props {
    return [
      timeEpoch,
      time,
      tempC,
      tempF,
      isDay,
      condition,
      windMph,
      windKph,
      windDegree,
      windDir,
      pressureMb,
      pressureIn,
      precipMm,
      precipIn,
      humidity,
      cloud,
      feelslikeC,
      feelslikeF,
      windchillC,
      windchillF,
      heatindexC,
      heatindexF,
      dewpointC,
      dewpointF,
      willItRain,
      chanceOfRain,
      willItSnow,
      chanceOfSnow,
      visKm,
      visMiles,
      gustMph,
      gustKph,
      uv,
    ];
  }
}
