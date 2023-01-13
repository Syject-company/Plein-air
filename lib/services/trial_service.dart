import 'dart:convert' as convert;
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:plein_air_club/models/check_trial.dart';
import 'package:plein_air_club/models/trial.dart';
import 'package:plein_air_club/models/trial_input.dart';

abstract class TrialService {
  Future<Trial> freeTrial(TrialInput input);

  Future<Trial> trialActivate(String hash);

  Future<CheckTrial> checkTrial(TrialInput trialInput);
}

class TrailServiceImplementation implements TrialService {
  final logger = Logger();

  @override
  Future<CheckTrial> checkTrial(TrialInput trialInput) async {
    const url = 'http://pleinair.bitage.it/index.php/api/check_free_trial';
    final link = Uri.parse(url);
    final bodyData = convert.json.encode(trialInput.toJson());

    final response = await http.post(link, body: bodyData);
    logger.d(response.statusCode);
    logger.d(response.body);
    final json = convert.jsonDecode(response.body);
    return CheckTrial.fromJson(json);
  }

  @override
  Future<Trial> freeTrial(TrialInput input) async {
    const url = 'http://pleinair.bitage.it/index.php/api/free_trial/';
    final link = Uri.parse(url);
    var rng = Random();
    final r = rng.nextInt(10000);

    final Map data = {
      'email': input.email,
      'udid': r.toString(),
    };
    logger.d(data);

    try {
      final response = await http.post(link, body: data);
      logger.d(response.statusCode);
      logger.d(response.body);
      final json = convert.jsonDecode(response.body);
      return Trial.fromJson(json);
    } catch (error) {
      logger.d(error);
      rethrow;
    }
  }

  @override
  Future<Trial> trialActivate(String hash) async {
    const url = 'http://pleinair.bitage.it/index.php/api/free_trial_activate/';
    final link = Uri.parse(url + hash);
    final response = await http.post(link);
    logger.d(response.statusCode);
    logger.d(response.body);
    final json = convert.jsonDecode(response.body);
    return Trial.fromJson(json);
  }
}
