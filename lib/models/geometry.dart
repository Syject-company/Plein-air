import 'package:json_annotation/json_annotation.dart';
import 'package:plein_air_club/models/location.dart';

part 'geometry.g.dart';

@JsonSerializable(explicitToJson: true)
class Geometry {
  Geometry({this.location});

  factory Geometry.fromJson(Map<String, dynamic> json) => _$GeometryFromJson(json); // ignore: lines_longer_than_80_chars

  Map<String, dynamic> toJson() => _$GeometryToJson(this);

  final Location? location;
}
