// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poi_search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

POISearch _$POISearchFromJson(Map<String, dynamic> json) {
  return POISearch(
    zoom: json['zoom'] as int?,
    text: json['text'] as String?,
    coords: json['coords'] as String?,
  );
}

Map<String, dynamic> _$POISearchToJson(POISearch instance) => <String, dynamic>{
      'zoom': instance.zoom,
      'text': instance.text,
      'coords': instance.coords,
    };
