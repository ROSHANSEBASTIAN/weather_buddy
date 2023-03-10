import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'astronomy.dart';
import 'location.dart';

part 'astro_info.g.dart';

@JsonSerializable()
class AstroInfo extends Equatable {
  final Location? location;
  final Astronomy? astronomy;

  const AstroInfo({this.location, this.astronomy});

  factory AstroInfo.fromJson(Map<String, dynamic> json) {
    return _$AstroInfoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AstroInfoToJson(this);

  @override
  List<Object?> get props => [location, astronomy];
}
