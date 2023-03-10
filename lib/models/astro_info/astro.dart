import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'astro.g.dart';

@JsonSerializable()
class Astro extends Equatable {
  final String? sunrise;
  final String? sunset;
  final String? moonrise;
  final String? moonset;
  @JsonKey(name: 'moon_phase')
  final String? moonPhase;
  @JsonKey(name: 'moon_illumination')
  final String? moonIllumination;
  @JsonKey(name: 'is_moon_up')
  final int? isMoonUp;
  @JsonKey(name: 'is_sun_up')
  final int? isSunUp;

  const Astro({
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.moonIllumination,
    this.isMoonUp,
    this.isSunUp,
  });

  factory Astro.fromJson(Map<String, dynamic> json) => _$AstroFromJson(json);

  Map<String, dynamic> toJson() => _$AstroToJson(this);

  @override
  List<Object?> get props {
    return [
      sunrise,
      sunset,
      moonrise,
      moonset,
      moonPhase,
      moonIllumination,
      isMoonUp,
      isSunUp,
    ];
  }
}
