// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Place _$PlaceFromJson(Map<String, dynamic> json) {
  return Place(
    geometry: json['geometry'] == null
        ? null
        : Geometry.fromJson(json['geometry'] as Map<String, dynamic>),
    name: json['name'] as String?,
    vicinity: json['vicinity'] as String?,
  );
}

Map<String, dynamic> _$PlaceToJson(Place instance) => <String, dynamic>{
      'geometry': instance.geometry?.toJson(),
      'name': instance.name,
      'vicinity': instance.vicinity,
    };
