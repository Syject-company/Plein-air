import 'package:json_annotation/json_annotation.dart';

part 'place_search.g.dart';

@JsonSerializable()
class PlaceSearch {
  PlaceSearch({
    this.description,
    this.place_id,
  });

  factory PlaceSearch.fromJson(Map<String, dynamic> json) => _$PlaceSearchFromJson(json); // ignore: lines_longer_than_80_chars

  Map<String, dynamic> toJson() => _$PlaceSearchToJson(this);

  final String? description;
  final String? place_id;
}
