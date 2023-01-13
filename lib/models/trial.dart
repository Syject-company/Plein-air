import 'package:json_annotation/json_annotation.dart';

part 'trial.g.dart';

@JsonSerializable()
class Trial {
  Trial({
    this.status,
    this.confirmed,
    this.start,
    this.stop,
    this.message,
  });

  factory Trial.fromJson(Map<String, dynamic> json) => _$TrialFromJson(json);

  Map<String, dynamic> toJson() => _$TrialToJson(this);

  final String? status;
  final int? confirmed;
  final String? start;
  final String? stop;
  final String? message;
}
