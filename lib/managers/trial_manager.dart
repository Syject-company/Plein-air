import 'package:logger/logger.dart';
import 'package:plein_air_club/models/check_trial.dart';
import 'package:plein_air_club/models/trial.dart';
import 'package:plein_air_club/models/trial_input.dart';
import 'package:plein_air_club/services/trial_service.dart';
import 'package:rxdart/rxdart.dart';

import '../service_locator.dart';

class TrialManager {
  TrialManager(){
    _requestSubject.listen((value) {
      logger.d(value.email);
      logger.d(value.udid);
      getFreeTrial(value).listen((event) {
        logger.d(event);
        freeTrialResult.add(event);
      });
    });

    _requestActivateSubject.listen((value) {
      logger.d(value);
      trialActivate(value).listen((event) {
        logger.d(event);
        _activateTrialResult.add(event);
      });
    });

    _requestCheckTrialSubject.listen((value) {
      logger.d(value);
      checkTrial(value).listen((event) {
        logger.d(event);
        _checkTrialResult.add(event);
      });
    });
  }
  final logger = Logger();

  final BehaviorSubject<TrialInput> _requestSubject =
  BehaviorSubject<TrialInput>(); // ignore: lines_longer_than_80_chars
  final PublishSubject<String> _requestActivateSubject =
  PublishSubject<String>(); // ignore: lines_longer_than_80_chars
  final PublishSubject<TrialInput> _requestCheckTrialSubject =
  PublishSubject<TrialInput>(); // ignore: lines_longer_than_80_chars

  final BehaviorSubject<Trial> freeTrialResult =
  BehaviorSubject<Trial>(); // ignore: lines_longer_than_80_chars
  final BehaviorSubject<Trial> _activateTrialResult =
  BehaviorSubject<Trial>(); // ignore: lines_longer_than_80_chars
  final BehaviorSubject<CheckTrial> _checkTrialResult =
  BehaviorSubject<CheckTrial>(); // ignore: lines_longer_than_80_chars


  Sink<TrialInput> get inRequest => _requestSubject.sink;
  Stream<Trial> get freeTrialResult$ => freeTrialResult.stream;

  Sink<String> get inActivateRequest => _requestActivateSubject.sink;
  Stream<Trial> get activateResult$ => _activateTrialResult.stream;

  Sink<TrialInput> get inCheckTrialRequest => _requestCheckTrialSubject.sink;
  Stream<CheckTrial> get checkTrialResult$ => _checkTrialResult.stream;

  Stream<Trial> getFreeTrial(TrialInput input) {
    return Stream.fromFuture(sl<TrialService>().freeTrial(input));
  }

  Stream<Trial> trialActivate(String hash) {
    return Stream.fromFuture(sl<TrialService>().trialActivate(hash));
  }

  Stream<CheckTrial> checkTrial(TrialInput input) {
    return Stream.fromFuture(sl<TrialService>().checkTrial(input));
  }

  void dispose() {
    _requestSubject.close();
    freeTrialResult.close();
    _requestActivateSubject.close();
    _activateTrialResult.close();
    _requestCheckTrialSubject.close();
    _checkTrialResult.close();
  }
}