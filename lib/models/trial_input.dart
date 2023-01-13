import 'package:json_annotation/json_annotation.dart';

part 'trial_input.g.dart';

@JsonSerializable()
class TrialInput {
  TrialInput({
    this.email,
    this.udid,
  });

  factory TrialInput.fromJson(Map<String, dynamic> json) => _$TrialInputFromJson(json); // ignore: lines_longer_than_80_chars

  Map<String, dynamic> toJson() => _$TrialInputToJson(this);

   String? email;
   String? udid;
}
