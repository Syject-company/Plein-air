import 'package:json_annotation/json_annotation.dart';
import 'package:plein_air_club/models/geometry.dart';

part 'place.g.dart';

@JsonSerializable(explicitToJson: true)
class Place {
  Place({
    this.geometry,
    this.name,
    this.vicinity,
  });

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceToJson(this);

  final Geometry? geometry;
  final String? name;
  final String? vicinity;
}
