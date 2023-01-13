import 'package:logger/logger.dart';
import 'package:plein_air_club/models/login.dart';
import 'package:plein_air_club/models/login_input.dart';
import 'package:plein_air_club/services/login_service.dart';
import 'package:rxdart/rxdart.dart';

import '../service_locator.dart';

class LoginManager {
  LoginManager(){
    _requestSubject.listen((value) {
      logger.d(value.user);
      logger.d(value.pwd);
      _login(value).listen((event) {
        logger.d(event.can_login);
        _loginResult.add(event);
      });
    });
  }

  final logger = Logger();

  final PublishSubject<LoginInput> _requestSubject =
  PublishSubject<LoginInput>(); // ignore: lines_longer_than_80_chars

  final BehaviorSubject<Login> _loginResult =
  BehaviorSubject<Login>(); // ignore: lines_longer_than_80_chars

  Sink<LoginInput> get inRequest => _requestSubject.sink;
  Stream<Login> get loginResult$ => _loginResult.stream;

  Stream<Login> _login(LoginInput input) {
    return Stream.fromFuture(sl<LoginService>().login(input));
  }

  void dispose() {
    _requestSubject.close();
    _loginResult.close();
  }
}