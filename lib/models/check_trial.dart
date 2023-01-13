import 'package:json_annotation/json_annotation.dart';

part 'check_trial.g.dart';

@JsonSerializable()
class CheckTrial {
  CheckTrial({
    this.status,
    this.confirmed,
    this.start,
    this.stop,
    this.message,
  });

  factory CheckTrial.fromJson(Map<String, dynamic> json) => _$CheckTrialFromJson(json);

  Map<String, dynamic> toJson() => _$CheckTrialToJson(this);

  final int? status;
  final int? confirmed;
  final String? start;
  final String? stop;
  final String? message;
}
