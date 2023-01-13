// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trending.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trending _$TrendingFromJson(Map<String, dynamic> json) {
  return Trending(
    id: json['id'] as String?,
    id_poi: json['id_poi'] as String?,
    CON: json['CON'] as String?,
    SOS: json['SOS'] as String?,
    SER: json['SER'] as String?,
    CAM: json['CAM'] as String?,
    ATT: json['ATT'] as String?,
    nome_poi: json['nome_poi'] as String?,
    citta_poi: json['citta_poi'] as String?,
    cap_poi: json['cap_poi'] as String?,
    provincia_poi: json['provincia_poi'] as String?,
    tot_rece: json['tot_rece'] as String?,
    tot_open: json['tot_open'] as String?,
    desc: json['desc'] as String?,
    desc_en: json['desc_en'] as String?,
    sconto: json['sconto'] as String?,
    sconto_en: json['sconto_en'] as String?,
    rev: json['rev'] as String?,
  );
}

Map<String, dynamic> _$TrendingToJson(Trending instance) => <String, dynamic>{
      'id': instance.id,
      'id_poi': instance.id_poi,
      'CON': instance.CON,
      'SOS': instance.SOS,
      'SER': instance.SER,
      'CAM': instance.CAM,
      'ATT': instance.ATT,
      'nome_poi': instance.nome_poi,
      'citta_poi': instance.citta_poi,
      'cap_poi': instance.cap_poi,
      'provincia_poi': instance.provincia_poi,
      'tot_rece': instance.tot_rece,
      'tot_open': instance.tot_open,
      'desc': instance.desc,
      'desc_en': instance.desc_en,
      'sconto': instance.sconto,
      'sconto_en': instance.sconto_en,
      'rev': instance.rev,
    };
