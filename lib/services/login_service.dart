import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:plein_air_club/models/login.dart';
import 'package:plein_air_club/models/login_input.dart';

abstract class LoginService {
  Future<Login> login(LoginInput loginInput);
}

class LoginServiceImplementation implements LoginService {
  final logger = Logger();

  @override
  Future<Login> login(LoginInput loginInput) async {
    const url = 'http://pleinair.bitage.it/index.php/api/login_user';
    final link = Uri.parse(url);

    final Map data = {'user': loginInput.user, 'pwd': loginInput.pwd};
    try {
      final response = await http.post(
        link,
        body: data,
      );
      //logger.d(response.statusCode);
      //logger.d(response.body);
      final json = convert.jsonDecode(response.body);
      return Login.fromJson(json);
    } catch (error) {
      logger.d(error);
      rethrow;
    }
  }
}
