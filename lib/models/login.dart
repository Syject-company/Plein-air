import 'package:json_annotation/json_annotation.dart';

part 'login.g.dart';

@JsonSerializable()
class Login {
  Login({
    this.can_login,
    this.expire_card,
    this.user_login,
    this.user_email,
    this.first_name,
    this.last_name,
    this.fiscal_id,
    this.phone,
    this.user_registered,
    this.message,
  });

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);

  Map<String, dynamic> toJson() => _$LoginToJson(this);

  final int? can_login;
  final String? expire_card;
  final String? user_login;
  final String? user_email;
  final String? first_name;
  final String? last_name;
  final String? fiscal_id;
  final String? phone;
  final String? user_registered;
  final String? message;
}
