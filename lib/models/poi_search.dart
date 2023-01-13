import 'package:json_annotation/json_annotation.dart';
import 'package:plein_air_club/models/location.dart';

part 'poi_search.g.dart';

@JsonSerializable(explicitToJson: true)
class POISearch {
  POISearch({this.zoom, this.text, this.coords});

  factory POISearch.fromJson(Map<String, dynamic> json) =>
      _$POISearchFromJson(json); // ignore: lines_longer_than_80_chars

  Map<String, dynamic> toJson() => _$POISearchToJson(this);

  int? zoom;
  String? text;
  String? coords;
}
