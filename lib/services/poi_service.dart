import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:plein_air_club/models/poi.dart';
import 'package:plein_air_club/models/poi_search.dart';

abstract class POIService {
  Future<List<POI>> getPoiList();
}

class POIServiceImplementation implements POIService {
  @override
  Future<List<POI>> getPoiList() async {
    final logger = Logger();

    const url = 'http://pleinair.bitage.it/index.php/api/FL_get_places/1/1/1/1/1/5/5';
    const location = ('30.033333,31.233334');
    final postSearch = POISearch(zoom: 14, coords: location, text: '');
    //logger.d(postSearch.text);
    // logger.d(postSearch.coords);
    final body = convert.json.encode(postSearch);
    // logger.d(body);
    final link = Uri.parse(url);
    final response = await http.post(
      link,
      body: {"zoom": "14", "coords": "42.504154,12.646361"},
    );
    logger.d(response.statusCode);
    //logger.d(response.body);

    final json = convert.jsonDecode(response.body) as List;
    logger.d(json);
    return json.map((place) => POI.fromJson(place)).toList();
  }
}
