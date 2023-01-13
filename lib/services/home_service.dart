import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:plein_air_club/models/featured.dart';
import 'package:plein_air_club/models/get_devices.dart';
import 'package:plein_air_club/models/images.dart';
import 'package:plein_air_club/models/news.dart';
import 'package:plein_air_club/models/trending.dart';
import 'package:plein_air_club/models/user_review.dart';

abstract class HomeService {
  Future<List<GetDevices>> getDevices(String card);
  Future<List<Featured>> getFeatured();
  Future<List<News>> getNews();
  Future<List<Trending>> getTrending();
  Future<List<UserReview>> getReviews(String card);
  Future<List<Images>> getImages(String card);
}

class HomeServiceImplementation implements HomeService {
  final logger = Logger();

  @override
  Future<List<GetDevices>> getDevices(String card) async {
    const url = 'http://pleinair.bitage.it/index.php/api/get_devices/';
    final link = Uri.parse(url + card);
    final response = await http.get(link);
    logger.d(response.statusCode);
    logger.d(response.body);
    final json = convert.jsonDecode(response.body) as List;
    return json.map((place) => GetDevices.fromJson(place)).toList();
  }

  @override
  Future<List<Featured>> getFeatured() async {
    const url = 'http://pleinair.bitage.it/index.php/api/get_featured';
    final link = Uri.parse(url);
    final response = await http.get(link);
    //logger.d(response.statusCode);
    //logger.d(response.body);
    final json = convert.jsonDecode(response.body) as List;
    return json.map((place) => Featured.fromJson(place)).toList();
  }

  @override
  Future<List<News>> getNews() async {
    const url = 'http://pleinair.bitage.it/index.php/api/get_news';
    final link = Uri.parse(url);
    final response = await http.get(link);
    logger.d(response.statusCode);
    logger.d(response.body);
    final json = convert.jsonDecode(response.body) as List;
    return json.map((place) => News.fromJson(place)).toList();
  }

  @override
  Future<List<UserReview>> getReviews(String card) async {
    const url = 'http://pleinair.bitage.it/index.php/api/get_user_reviews/';
    final link = Uri.parse(url+card);
    final response = await http.get(link);
    logger.d(response.statusCode);
    logger.d(response.body);
    final json = convert.jsonDecode(response.body) as List;
    return json.map((place) => UserReview.fromJson(place)).toList();
  }

  @override
  Future<List<Images>> getImages(String card) async {
    const url = 'http://pleinair.bitage.it/index.php/api/get_images/';
    final link = Uri.parse(url+card);
    final response = await http.get(link);
    logger.d(response.statusCode);
    logger.d(response.body);
    final json = convert.jsonDecode(response.body) as List;
    return json.map((place) => Images.fromJson(place)).toList();
  }

  @override
  Future<List<Trending>> getTrending() async {
    const url = 'http://pleinair.bitage.it/index.php/api/get_trending';
    final link = Uri.parse(url);
    final response = await http.get(link);
   // logger.d(response.statusCode);
    //logger.d(response.body);
    final json = convert.jsonDecode(response.body) as List;
    return json.map((place) => Trending.fromJson(place)).toList();
  }
}
