// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_trial.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckTrial _$CheckTrialFromJson(Map<String, dynamic> json) {
  return CheckTrial(
    status: json['status'] as int?,
    confirmed: json['confirmed'] as int?,
    start: json['start'] as String?,
    stop: json['stop'] as String?,
    message: json['message'] as String?,
  );
}

Map<String, dynamic> _$CheckTrialToJson(CheckTrial instance) =>
    <String, dynamic>{
      'status': instance.status,
      'confirmed': instance.confirmed,
      'start': instance.start,
      'stop': instance.stop,
      'message': instance.message,
    };
