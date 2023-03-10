// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'astro_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AstroInfo _$AstroInfoFromJson(Map<String, dynamic> json) => AstroInfo(
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      astronomy: json['astronomy'] == null
          ? null
          : Astronomy.fromJson(json['astronomy'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AstroInfoToJson(AstroInfo instance) => <String, dynamic>{
      'location': instance.location,
      'astronomy': instance.astronomy,
    };
