// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sports.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sports _$SportsFromJson(Map<String, dynamic> json) => Sports(
      football: (json['football'] as List<dynamic>?)
          ?.map((e) => Football.fromJson(e as Map<String, dynamic>))
          .toList(),
      cricket: (json['cricket'] as List<dynamic>?)
          ?.map((e) => Cricket.fromJson(e as Map<String, dynamic>))
          .toList(),
      golf: (json['golf'] as List<dynamic>?)
          ?.map((e) => Golf.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SportsToJson(Sports instance) => <String, dynamic>{
      'football': instance.football,
      'cricket': instance.cricket,
      'golf': instance.golf,
    };
