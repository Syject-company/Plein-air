// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trial.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trial _$TrialFromJson(Map<String, dynamic> json) {
  return Trial(
    status: json['status'] as String?,
    confirmed: json['confirmed'] as int?,
    start: json['start'] as String?,
    stop: json['stop'] as String?,
    message: json['message'] as String?,
  );
}

Map<String, dynamic> _$TrialToJson(Trial instance) => <String, dynamic>{
      'status': instance.status,
      'confirmed': instance.confirmed,
      'start': instance.start,
      'stop': instance.stop,
      'message': instance.message,
    };
