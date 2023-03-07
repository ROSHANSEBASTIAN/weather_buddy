import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cricket.g.dart';

@JsonSerializable()
class Cricket extends Equatable {
  final String? stadium;
  final String? country;
  final String? region;
  final String? tournament;
  final String? start;
  final String? match;

  const Cricket({
    this.stadium,
    this.country,
    this.region,
    this.tournament,
    this.start,
    this.match,
  });

  factory Cricket.fromJson(Map<String, dynamic> json) {
    return _$CricketFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CricketToJson(this);

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
