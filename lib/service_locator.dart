import 'package:get_it/get_it.dart';
import 'package:plein_air_club/managers/home_manager.dart';
import 'package:plein_air_club/managers/login_manager.dart';
import 'package:plein_air_club/managers/map_manger.dart';
import 'package:plein_air_club/managers/poi_manager.dart';
import 'package:plein_air_club/managers/trial_manager.dart';
import 'package:plein_air_club/services/geolocator_service.dart';
import 'package:plein_air_club/services/home_service.dart';
import 'package:plein_air_club/services/login_service.dart';
import 'package:plein_air_club/services/places_service.dart';
import 'package:plein_air_club/services/poi_service.dart';
import 'package:plein_air_club/services/trial_service.dart';

GetIt sl = GetIt.instance;

void setUpServiceLocator() {
  // register services
  sl.registerLazySingleton<GeoLocatorService>(() => GeoLocatorServiceImplementation()); // ignore: lines_longer_than_80_chars
  sl.registerLazySingleton<PlacesService>(() => PlacesServiceImplementation()); // ignore: lines_longer_than_80_chars
  sl.registerLazySingleton<POIService>(() => POIServiceImplementation()); // ignore: lines_longer_than_80_chars
  sl.registerLazySingleton<TrialService>(() => TrailServiceImplementation()); // ignore: lines_longer_than_80_chars
  sl.registerLazySingleton<LoginService>(() => LoginServiceImplementation()); // ignore: lines_longer_than_80_chars
  sl.registerLazySingleton<HomeService>(() => HomeServiceImplementation()); // ignore: lines_longer_than_80_chars

  // register managers
  sl.registerLazySingleton<PoiManager>(() => PoiManager());
  sl.registerLazySingleton<MapManager>(() => MapManager());
  sl.registerLazySingleton<TrialManager>(() => TrialManager());
  sl.registerLazySingleton<LoginManager>(() => LoginManager());
  sl.registerLazySingleton<HomeManager>(() => HomeManager());
}
