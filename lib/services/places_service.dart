import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:plein_air_club/models/place.dart';
import 'package:plein_air_club/models/place_search.dart';

abstract class PlacesService {
  Future<List<PlaceSearch>> getAutoComplete(String search);

  Future<Place> getPlace(String placeId);
}

class PlacesServiceImplementation implements PlacesService {
  final key = 'AIzaSyDZkJzeIJ-KhgLPt-h2hPV9xll4iV_T184';

  //final key = 'AIzaSyCmX-FC_flOdGcNfNyFIeVrZRM6wVpTYkQ';
  final logger = Logger();

  @override
  Future<List<PlaceSearch>> getAutoComplete(String search) async {
    final url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&types=(cities)&key=$key';

    final link = Uri.parse(url);
    final response = await http.get(link);

    final json = convert.jsonDecode(response.body);

    final jsonResults = json['predictions'] as List;
    logger.d(jsonResults);
    return jsonResults.map((place) => PlaceSearch.fromJson(place)).toList();
  }

  @override
  Future<Place> getPlace(String placeId) async {
    final url =
        'https://maps.googleapis.com/maps/api/place/details/json?key=$key&place_id=$placeId';

    final link = Uri.parse(url);
    final response = await http.get(link);

    final json = convert.jsonDecode(response.body);

    final jsonResults = json['result'] as Map<String, dynamic>;
    return Place.fromJson(jsonResults);
  }
}
