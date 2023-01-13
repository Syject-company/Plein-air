// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login _$LoginFromJson(Map<String, dynamic> json) {
  return Login(
    can_login: json['can_login'] as int?,
    expire_card: json['expire_card'] as String?,
    user_login: json['user_login'] as String?,
    user_email: json['user_email'] as String?,
    first_name: json['first_name'] as String?,
    last_name: json['last_name'] as String?,
    fiscal_id: json['fiscal_id'] as String?,
    phone: json['phone'] as String?,
    user_registered: json['user_registered'] as String?,
    message: json['message'] as String?,
  );
}

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
      'can_login': instance.can_login,
      'expire_card': instance.expire_card,
      'user_login': instance.user_login,
      'user_email': instance.user_email,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'fiscal_id': instance.fiscal_id,
      'phone': instance.phone,
      'user_registered': instance.user_registered,
      'message': instance.message,
    };
