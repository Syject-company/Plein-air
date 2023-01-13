// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

POI _$POIFromJson(Map<String, dynamic> json) {
  return POI(
    favorite: json['favorite'] as int?,
    id_poi: json['id_poi'] as String?,
    cat_camping: json['cat_camping'] as String?,
    cat_areeservizio: json['cat_areeservizio'] as String?,
    cat_convenzioni: json['cat_convenzioni'] as String?,
    cat_areesosta: json['cat_areesosta'] as String?,
    cat_attrazioni: json['cat_attrazioni'] as String?,
    cat_allianz: json['cat_allianz'] as String?,
    nome_poi: json['nome_poi'] as String?,
    lat_poi: json['lat_poi'] as String?,
    lon_poi: json['lon_poi'] as String?,
    indirizzo_poi: json['indirizzo_poi'] as String?,
    regione_poi: json['regione_poi'] as String?,
    citta_poi: json['citta_poi'] as String?,
    cap_poi: json['cap_poi'] as String?,
    provincia_poi: json['provincia_poi'] as String?,
    nazione_poi: json['nazione_poi'] as String?,
    tipologia: json['tipologia'] as String?,
    distance: json['distance'] as String?,
    desc_poi: json['desc_poi'] as String?,
    square_image: json['square_image'] as String?,
    large_image: json['large_image'] as String?,
    average: json['average'] as int?,
  );
}

Map<String, dynamic> _$POIToJson(POI instance) => <String, dynamic>{
      'favorite': instance.favorite,
      'id_poi': instance.id_poi,
      'cat_camping': instance.cat_camping,
      'cat_areeservizio': instance.cat_areeservizio,
      'cat_convenzioni': instance.cat_convenzioni,
      'cat_areesosta': instance.cat_areesosta,
      'cat_attrazioni': instance.cat_attrazioni,
      'cat_allianz': instance.cat_allianz,
      'nome_poi': instance.nome_poi,
      'lat_poi': instance.lat_poi,
      'lon_poi': instance.lon_poi,
      'indirizzo_poi': instance.indirizzo_poi,
      'regione_poi': instance.regione_poi,
      'citta_poi': instance.citta_poi,
      'cap_poi': instance.cap_poi,
      'provincia_poi': instance.provincia_poi,
      'nazione_poi': instance.nazione_poi,
      'tipologia': instance.tipologia,
      'distance': instance.distance,
      'desc_poi': instance.desc_poi,
      'square_image': instance.square_image,
      'large_image': instance.large_image,
      'average': instance.average,
    };
