// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceSearch _$PlaceSearchFromJson(Map<String, dynamic> json) {
  return PlaceSearch(
    description: json['description'] as String?,
    place_id: json['place_id'] as String?,
  );
}

Map<String, dynamic> _$PlaceSearchToJson(PlaceSearch instance) =>
    <String, dynamic>{
      'description': instance.description,
      'place_id': instance.place_id,
    };
