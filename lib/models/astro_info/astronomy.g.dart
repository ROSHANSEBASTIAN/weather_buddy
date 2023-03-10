// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'astronomy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Astronomy _$AstronomyFromJson(Map<String, dynamic> json) => Astronomy(
      astro: json['astro'] == null
          ? null
          : Astro.fromJson(json['astro'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AstronomyToJson(Astronomy instance) => <String, dynamic>{
      'astro': instance.astro,
    };
