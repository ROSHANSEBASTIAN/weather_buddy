import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'condition.dart';

part 'day.g.dart';

@JsonSerializable()
class Day extends Equatable {
  @JsonKey(name: 'maxtemp_c')
  final double? maxtempC;
  @JsonKey(name: 'maxtemp_f')
  final double? maxtempF;
  @JsonKey(name: 'mintemp_c')
  final double? mintempC;
  @JsonKey(name: 'mintemp_f')
  final double? mintempF;
  @JsonKey(name: 'avgtemp_c')
  final double? avgtempC;
  @JsonKey(name: 'avgtemp_f')
  final double? avgtempF;
  @JsonKey(name: 'maxwind_mph')
  final double? maxwindMph;
  @JsonKey(name: 'maxwind_kph')
  final double? maxwindKph;
  @JsonKey(name: 'totalprecip_mm')
  final double? totalprecipMm;
  @JsonKey(name: 'totalprecip_in')
  final double? totalprecipIn;
  @JsonKey(name: 'totalsnow_cm')
  final double? totalsnowCm;
  @JsonKey(name: 'avgvis_km')
  final double? avgvisKm;
  @JsonKey(name: 'avgvis_miles')
  final double? avgvisMiles;
  final double? avghumidity;
  @JsonKey(name: 'daily_will_it_rain')
  final int? dailyWillItRain;
  @JsonKey(name: 'daily_chance_of_rain')
  final int? dailyChanceOfRain;
  @JsonKey(name: 'daily_will_it_snow')
  final int? dailyWillItSnow;
  @JsonKey(name: 'daily_chance_of_snow')
  final int? dailyChanceOfSnow;
  final Condition? condition;
  final double? uv;

  const Day({
    this.maxtempC,
    this.maxtempF,
    this.mintempC,
    this.mintempF,
    this.avgtempC,
    this.avgtempF,
    this.maxwindMph,
    this.maxwindKph,
    this.totalprecipMm,
    this.totalprecipIn,
    this.totalsnowCm,
    this.avgvisKm,
    this.avgvisMiles,
    this.avghumidity,
    this.dailyWillItRain,
    this.dailyChanceOfRain,
    this.dailyWillItSnow,
    this.dailyChanceOfSnow,
    this.condition,
    this.uv,
  });

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);

  Map<String, dynamic> toJson() => _$DayToJson(this);

  @override
  List<Object?> get props {
    return [
      maxtempC,
      maxtempF,
      mintempC,
      mintempF,
      avgtempC,
      avgtempF,
      maxwindMph,
      maxwindKph,
      totalprecipMm,
      totalprecipIn,
      totalsnowCm,
      avgvisKm,
      avgvisMiles,
      avghumidity,
      dailyWillItRain,
      dailyChanceOfRain,
      dailyWillItSnow,
      dailyChanceOfSnow,
      condition,
      uv,
    ];
  }
}
