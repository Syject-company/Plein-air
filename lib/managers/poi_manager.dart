import 'package:logger/logger.dart';
import 'package:plein_air_club/helpers/location_command.dart';
import 'package:plein_air_club/models/poi.dart';
import 'package:plein_air_club/services/poi_service.dart';
import 'package:rxdart/rxdart.dart';

import '../service_locator.dart';

class PoiManager {
  PoiManager() {
    _requestSubject.listen((value) {
      getPoiList().listen((event) {
        _poiListResult.add(event);
      });
    });
  }

  final logger = Logger();

  final PublishSubject<RequestCommand> _requestSubject =
      PublishSubject<RequestCommand>(); // ignore: lines_longer_than_80_chars
  final BehaviorSubject<List<POI>> _poiListResult =
      BehaviorSubject<List<POI>>(); // ignore: lines_longer_than_80_chars

  Sink<RequestCommand> get inRequest => _requestSubject.sink;

  Stream<List<POI>> get poiListResult$ => _poiListResult.stream;

  Stream<List<POI>> getPoiList() {
    return Stream.fromFuture(sl<POIService>().getPoiList());
  }

  void dispose() {
    _requestSubject.close();
    _poiListResult.close();
  }
}
