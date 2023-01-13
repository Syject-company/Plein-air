import 'package:logger/logger.dart';
import 'package:plein_air_club/helpers/location_command.dart';
import 'package:plein_air_club/models/featured.dart';
import 'package:plein_air_club/models/get_devices.dart';
import 'package:plein_air_club/models/images.dart';
import 'package:plein_air_club/models/news.dart';
import 'package:plein_air_club/models/trending.dart';
import 'package:plein_air_club/models/user_review.dart';
import 'package:plein_air_club/services/home_service.dart';
import 'package:rxdart/rxdart.dart';

import '../service_locator.dart';

class HomeManager {
  HomeManager() {
    _requestSubject.listen((value) {
      logger.d(value);
      getDevices(value).listen((event) {
        logger.d(event);
        _getDevicesResult.add(event);
      });
    });

    _requestFeaturedSubject.listen((value) {
      logger.d(value);
      getFeatured().listen((event) {
        // logger.d(event);
        _getFeaturedResult.add(event);
      });
    });

    _requestNewsSubject.listen((value) {
      logger.d(value);
      getNews().listen((event) {
        // logger.d(event);
        _getNewsResult.add(event);
      });
    });

    _requestTrendingSubject.listen((value) {
      logger.d(value);
      getTrending().listen((event) {
        // logger.d(event);
        _getTrendingResult.add(event);
      });
    });
    _requestReviewsSubject.listen((value) {
      logger.d(value);
      getReviews(value).listen((event) {
        // logger.d(event);
        _getReviewsResult.add(event);
      });
    });

    _requestImagesSubject.listen((value) {
      logger.d(value);
      getImages(value).listen((event) {
        // logger.d(event);
        _getImagesResult.add(event);
      });
    });
  }

  final logger = Logger();

  final PublishSubject<String> _requestSubject =
      PublishSubject<String>(); // ignore: lines_longer_than_80_chars
  final PublishSubject<RequestCommand> _requestFeaturedSubject =
      PublishSubject<RequestCommand>(); // ignore: lines_longer_than_80_chars
  final PublishSubject<RequestCommand> _requestNewsSubject =
      PublishSubject<RequestCommand>(); // ignore: lines_longer_than_80_chars
  final PublishSubject<RequestCommand> _requestTrendingSubject =
      PublishSubject<RequestCommand>(); // ignore: lines_longer_than_80_chars
  final PublishSubject<String> _requestReviewsSubject =
      PublishSubject<String>(); // ignore: lines_longer_than_80_chars
  final PublishSubject<String> _requestImagesSubject =
      PublishSubject<String>(); // ignore: lines_longer_than_80_chars

  final BehaviorSubject<List<GetDevices>> _getDevicesResult =
      BehaviorSubject<List<GetDevices>>(); // ignore: lines_longer_than_80_chars
  final BehaviorSubject<List<Featured>> _getFeaturedResult =
      BehaviorSubject<List<Featured>>(); // ignore: lines_longer_than_80_chars
  final BehaviorSubject<List<News>> _getNewsResult =
      BehaviorSubject<List<News>>(); // ignore: lines_longer_than_80_chars
  final BehaviorSubject<List<Trending>> _getTrendingResult =
  BehaviorSubject<List<Trending>>(); // ignore: lines_longer_than_80_chars
  final BehaviorSubject<List<UserReview>> _getReviewsResult =
      BehaviorSubject<List<UserReview>>(); // ignore: lines_longer_than_80_chars
  final BehaviorSubject<List<Images>> _getImagesResult =
      BehaviorSubject<List<Images>>(); // ignore: lines_longer_than_80_chars

  Sink<String> get inRequest => _requestSubject.sink;

  Stream<List<GetDevices>> get freeTrialResult$ => _getDevicesResult.stream;

  Sink<RequestCommand> get inFeaturedRequest => _requestFeaturedSubject.sink;

  Stream<List<Featured>> get getFeaturedResult$ => _getFeaturedResult.stream;

  Sink<RequestCommand> get inNewsRequest => _requestNewsSubject.sink;

  Stream<List<News>> get getNewsResult$ => _getNewsResult.stream;

  Sink<RequestCommand> get inTrendingRequest => _requestTrendingSubject.sink;

  Stream<List<Trending>> get getTrendingResult$ => _getTrendingResult.stream;

  Sink<String> get inReviewRequest => _requestReviewsSubject.sink;

  Stream<List<UserReview>> get getReviewResult$ => _getReviewsResult.stream;

  Sink<String> get inImagesRequest => _requestImagesSubject.sink;

  Stream<List<Images>> get getImagesResult$ => _getImagesResult.stream;

  Stream<List<GetDevices>> getDevices(String input) {
    return Stream.fromFuture(sl<HomeService>().getDevices(input));
  }

  Stream<List<Featured>> getFeatured() {
    return Stream.fromFuture(sl<HomeService>().getFeatured());
  }

  Stream<List<News>> getNews() {
    return Stream.fromFuture(sl<HomeService>().getNews());
  }

  Stream<List<Trending>> getTrending() {
    return Stream.fromFuture(sl<HomeService>().getTrending());
  }

  Stream<List<UserReview>> getReviews(String card) {
    return Stream.fromFuture(sl<HomeService>().getReviews(card));
  }

  Stream<List<Images>> getImages(String card) {
    return Stream.fromFuture(sl<HomeService>().getImages(card));
  }

  void dispose() {
    _requestSubject.close();
    _getDevicesResult.close();
    _requestFeaturedSubject.close();
    _getFeaturedResult.close();
    _requestNewsSubject.close();
    _getNewsResult.close();
    _requestReviewsSubject.close();
    _getReviewsResult.close();
    _requestImagesSubject.close();
    _getImagesResult.close();
    _requestTrendingSubject.close();
  }
}
