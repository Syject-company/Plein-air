import 'package:geolocator/geolocator.dart';
import 'package:plein_air_club/helpers/location_command.dart';
import 'package:plein_air_club/models/place.dart';
import 'package:plein_air_club/models/place_search.dart';
import 'package:plein_air_club/services/geolocator_service.dart';
import 'package:plein_air_club/services/places_service.dart';
import 'package:rxdart/rxdart.dart';

import '../service_locator.dart';

class MapManager {
  MapManager() {
    _requestSubject.listen((value) {
      setCurrentLocation().listen((event) {
        _currentLocation.add(event);
      });
    });

    _searchPlace.listen((value) {
      searchPlaces(value).listen((event) {
        searchPlaceResult.add(event);
      });
    });

    _getPlaceID.listen((value) {
      getPlaceId(value).listen((event) {
        placeIDResult.add(event);
      });
    });
  }

  final PublishSubject<RequestCommand> _requestSubject =
      PublishSubject<RequestCommand>(); // ignore: lines_longer_than_80_chars
  final BehaviorSubject<Position> _currentLocation =
      BehaviorSubject<Position>(); // ignore: lines_longer_than_80_chars
  final BehaviorSubject<String> _searchPlace =
      BehaviorSubject<String>(); // ignore: lines_longer_than_80_chars
  final BehaviorSubject<List<PlaceSearch>> searchPlaceResult =
      BehaviorSubject<List<PlaceSearch>>(); // ignore: lines_longer_than_80_chars
  final BehaviorSubject<String> _getPlaceID = BehaviorSubject<String>();
  final BehaviorSubject<Place> placeIDResult = BehaviorSubject<Place>();

  Sink<RequestCommand> get inRequest => _requestSubject.sink;

  Sink<String> get inSearchTerm => _searchPlace.sink;

  Sink<String> get inPlaceID => _getPlaceID.sink;

  Stream<Position> get currentLocation$ => _currentLocation.stream;

  Stream<Place> get placeID$ => placeIDResult.stream;

  Stream<List<PlaceSearch>> get searchPlaceResult$ => searchPlaceResult.stream;

  Stream setCurrentLocation() {
    return Stream.fromFuture(sl<GeoLocatorService>().getCurrentLocation());
  }

  Stream searchPlaces(String searchTerm) {
    return Stream.fromFuture(sl<PlacesService>().getAutoComplete(searchTerm));
  }

  Stream getPlaceId(String searchTerm) {
    return Stream.fromFuture(sl<PlacesService>().getPlace(searchTerm));
  }

  void dispose() {
    _requestSubject.close();
    _currentLocation.close();
    _searchPlace.close();
    searchPlaceResult.close();
    _getPlaceID.close();
    placeIDResult.close();
  }
}
