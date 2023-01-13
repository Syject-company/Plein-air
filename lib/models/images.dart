import 'package:json_annotation/json_annotation.dart';

part 'images.g.dart';

@JsonSerializable()
class Images {
  Images({
    this.ga_user,
    this.pr_tessera,
    this.ga_online,
    this.ga_id,
    this.cat_areesosta,
    this.cat_areeservizio,
    this.cat_camping,
    this.cat_attrazioni,
    this.nome_poi,
    this.id_poi,
    this.nominativo,
    this.ga_file,
  });

  factory Images.fromJson(Map<String, dynamic> json) =>
      _$ImagesFromJson(json); // ignore: lines_longer_than_80_chars

  Map<String, dynamic> toJson() => _$ImagesToJson(this);

  final String? ga_user;
  final String? pr_tessera;
  final String? ga_online;
  final String? ga_id;
  final String? cat_areesosta;
  final String? cat_areeservizio;
  final String? cat_camping;
  final String? cat_attrazioni;
  final String? nome_poi;
  final String? id_poi;
  final String? nominativo;
  final String? ga_file;
}
