import 'package:json_annotation/json_annotation.dart';

part 'get_devices.g.dart';

@JsonSerializable()
class GetDevices {
  GetDevices({
    this.id,
    this.pr_codice,
    this.pr_tessera,
    this.pr_foto,
    this.pr_email,
    this.pr_nome,
    this.pr_cognome,
    this.pr_telefono,
    this.pr_attivo,
    this.pr_useragent,
    this.pr_birth,
    this.pr_luogo,
    this.pr_fbid,
    this.pr_gender,
    this.pr_data,
    this.pr_udid,
    this.pr_token,
    this.pr_firebase_token,
    this.pr_device,
    this.pr_pushed,
    this.pr_recensioni,
    this.pr_login,
    this.pr_last_login,
    this.pr_foto_up,
    this.invisibile,
    this.pr_install_id,
  });

  factory GetDevices.fromJson(Map<String, dynamic> json) =>
      _$GetDevicesFromJson(json); // ignore: lines_longer_than_80_chars

  Map<String, dynamic> toJson() => _$GetDevicesToJson(this);

  final String? id;
  final String? pr_codice;
  final String? pr_tessera;
  final String? pr_foto;
  final String? pr_email;
  final String? pr_nome;
  final String? pr_cognome;
  final String? pr_telefono;
  final String? pr_attivo;
  final String? pr_useragent;
  final String? pr_birth;
  final String? pr_luogo;
  final String? pr_fbid;
  final String? pr_gender;
  final String? pr_data;
  final String? pr_udid;
  final String? pr_token;
  final String? pr_firebase_token;
  final String? pr_device;
  final String? pr_pushed;
  final String? pr_recensioni;
  final String? pr_login;
  final String? pr_last_login;
  final String? pr_foto_up;
  final String? invisibile;
  final String? pr_install_id;
}
