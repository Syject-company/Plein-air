import 'package:json_annotation/json_annotation.dart';

part 'poi.g.dart';

@JsonSerializable()
class POI {
  POI({
    this.favorite,
    this.id_poi,
    this.cat_camping,
    this.cat_areeservizio,
    this.cat_convenzioni,
    this.cat_areesosta,
    this.cat_attrazioni,
    this.cat_allianz,
    this.nome_poi,
    this.lat_poi,
    this.lon_poi,
    this.indirizzo_poi,
    this.regione_poi,
    this.citta_poi,
    this.cap_poi,
    this.provincia_poi,
    this.nazione_poi,
    this.tipologia,
    this.distance,
    this.desc_poi,
    this.square_image,
    this.large_image,
    this.average
});

  factory POI.fromJson(Map<String, dynamic> json) =>
      _$POIFromJson(json); // ignore: lines_longer_than_80_chars

  Map<String, dynamic> toJson() => _$POIToJson(this);

  int? favorite;
  String? id_poi;
  String? cat_camping;
  String? cat_areeservizio;
  String? cat_convenzioni;
  String? cat_areesosta;
  String? cat_attrazioni;
  String? cat_allianz;
  String? nome_poi;
  String? lat_poi;
  String? lon_poi;
  String? indirizzo_poi;
  String? regione_poi;
  String? citta_poi;
  String? cap_poi;
  String? provincia_poi;
  String? nazione_poi;
  String? tipologia;
  String? distance;
  String? desc_poi;
  String? square_image;
  String? large_image;
  int? average;


}
