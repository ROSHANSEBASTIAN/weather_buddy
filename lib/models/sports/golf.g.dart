// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'golf.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Golf _$GolfFromJson(Map<String, dynamic> json) => Golf(
      stadium: json['stadium'] as String?,
      country: json['country'] as String?,
      region: json['region'] as String?,
      tournament: json['tournament'] as String?,
      start: json['start'] as String?,
      match: json['match'] as String?,
    );

Map<String, dynamic> _$GolfToJson(Golf instance) => <String, dynamic>{
      'stadium': instance.stadium,
      'country': instance.country,
      'region': instance.region,
      'tournament': instance.tournament,
      'start': instance.start,
      'match': instance.match,
    };
