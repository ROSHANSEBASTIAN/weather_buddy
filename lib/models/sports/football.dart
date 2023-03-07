import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'football.g.dart';

@JsonSerializable()
class Football extends Equatable {
  final String? stadium;
  final String? country;
  final String? region;
  final String? tournament;
  final String? start;
  final String? match;

  const Football({
    this.stadium,
    this.country,
    this.region,
    this.tournament,
    this.start,
    this.match,
  });

  factory Football.fromJson(Map<String, dynamic> json) {
    return _$FootballFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FootballToJson(this);

  @override
  List<Object?> get props {
    return [
      stadium,
      country,
      region,
      tournament,
      start,
      match,
    ];
  }
}
