import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
  Location({
    this.lat,
    this.lng,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json); // ignore: lines_longer_than_80_chars

  Map<String, dynamic> toJson() => _$LocationToJson(this);

  double? lat;
  double? lng;
}
