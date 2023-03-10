import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'golf.g.dart';

@JsonSerializable()
class Golf extends Equatable {
  final String? stadium;
  final String? country;
  final String? region;
  final String? tournament;
  final String? start;
  final String? match;

  const Golf({
    this.stadium,
    this.country,
    this.region,
    this.tournament,
    this.start,
    this.match,
  });

  factory Golf.fromJson(Map<String, dynamic> json) {
    return _$GolfFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GolfToJson(this);

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
