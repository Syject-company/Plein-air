import 'package:geolocator/geolocator.dart';

abstract class GeoLocatorService {
  Future<Position> getCurrentLocation();
}

class GeoLocatorServiceImplementation implements GeoLocatorService {
  @override
  Future<Position> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}
