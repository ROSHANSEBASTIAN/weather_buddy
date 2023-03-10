import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_buddy/models/sports/golf.dart';

import 'cricket.dart';
import 'football.dart';

part 'sports.g.dart';

@JsonSerializable()
class Sports extends Equatable {
  final List<Football>? football;
  final List<Cricket>? cricket;
  final List<Golf>? golf;

  const Sports({this.football, this.cricket, this.golf});

  factory Sports.fromJson(Map<String, dynamic> json) {
    return _$SportsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SportsToJson(this);

  @override
  List<Object?> get props => [football, cricket, golf];
}
