// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) {
  return News(
    id_push: json['id_push'] as String?,
    titolo: json['titolo'] as String?,
    testo: json['testo'] as String?,
    link: json['link'] as String?,
    dataInvio: json['dataInvio'] as String?,
    dataCreazione: json['dataCreazione'] as String?,
    poi: json['poi'] as String?,
    lastIdProfSent: json['lastIdProfSent'] as String?,
    attivo: json['attivo'] as String?,
    stato: json['stato'] as String?,
    lang: json['lang'] as String?,
  );
}

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'id_push': instance.id_push,
      'titolo': instance.titolo,
      'testo': instance.testo,
      'link': instance.link,
      'dataInvio': instance.dataInvio,
      'dataCreazione': instance.dataCreazione,
      'poi': instance.poi,
      'lastIdProfSent': instance.lastIdProfSent,
      'attivo': instance.attivo,
      'stato': instance.stato,
      'lang': instance.lang,
    };
