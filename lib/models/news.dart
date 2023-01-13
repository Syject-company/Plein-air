import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable()
class News {
  News({
    this.id_push,
    this.titolo,
    this.testo,
    this.link,
    this.dataInvio,
    this.dataCreazione,
    this.poi,
    this.lastIdProfSent,
    this.attivo,
    this.stato,
    this.lang,
  });

  factory News.fromJson(Map<String, dynamic> json) =>
      _$NewsFromJson(json); // ignore: lines_longer_than_80_chars

  Map<String, dynamic> toJson() => _$NewsToJson(this);

  final String? id_push;
  final String? titolo;
  final String? testo;
  final String? link;
  final String? dataInvio;
  final String? dataCreazione;
  final String? poi;
  final String? lastIdProfSent;
  final String? attivo;
  final String? stato;
  final String? lang;
}
