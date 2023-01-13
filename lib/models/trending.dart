import 'package:json_annotation/json_annotation.dart';

part 'trending.g.dart';

@JsonSerializable()
class Trending {
  Trending({
    this.id,
    this.id_poi,
    this.CON,
    this.SOS,
    this.SER,
    this.CAM,
    this.ATT,
    this.nome_poi,
    this.citta_poi,
    this.cap_poi,
    this.provincia_poi,
    this.tot_rece,
    this.tot_open,
    this.desc,
    this.desc_en,
    this.sconto,
    this.sconto_en,
    this.rev,
  });

  factory Trending.fromJson(Map<String, dynamic> json) => _$TrendingFromJson(json);

  Map<String, dynamic> toJson() => _$TrendingToJson(this);

  final String? id;
  final String? id_poi;
  final String? CON;
  final String? SOS;
  final String? SER;
  final String? CAM;
  final String? ATT;
  final String? nome_poi;
  final String? citta_poi;
  final String? cap_poi;
  final String? provincia_poi;
  final String? tot_rece;
  final String? tot_open;
  final String? desc;
  final String? desc_en;
  final String? sconto;
  final String? sconto_en;
  final String? rev;
}
