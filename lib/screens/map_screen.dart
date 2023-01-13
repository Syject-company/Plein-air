import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logger/logger.dart';
import 'package:plein_air_club/helpers/constants.dart';
import 'package:plein_air_club/helpers/location_command.dart';
import 'package:plein_air_club/managers/map_manger.dart';
import 'package:plein_air_club/managers/poi_manager.dart';
import 'package:plein_air_club/models/place.dart';

//import 'package:plein_air_club/models/place.dart';
import 'package:plein_air_club/models/place_search.dart';

import '../service_locator.dart';

class MapScreen extends StatefulWidget {
  static const String id = '/map_screen';

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _mapController = Completer();
  late ClusterManager _manager;
  final logger = Logger();

  Set<Marker> markers = Set();

  final CameraPosition _parisCameraPosition =
      const CameraPosition(target: LatLng(44.88946, 8.352222), zoom: 14.0);

  List<ClusterItem<Place>> itemsList = [];

  @override
  void initState() {
    sl<PoiManager>().inRequest.add(RequestCommand.START);

    sl<MapManager>().placeID$.listen((event) {
      _goToPLace(event);
    });

    sl<PoiManager>().poiListResult$.listen((event) {
      logger.d(event.length);

      for (var i = 0; i < event.length; i++) {
        var lat = double.parse(event[i].lat_poi!.replaceAll(',', '.'));
        final lon = double.parse(event[i].lon_poi!.replaceAll(',', '.'));
        itemsList.add(
          ClusterItem(LatLng(lat, lon), item: Place(name: event[i].nome_poi)),
        );
      }
    });

    _manager = _initClusterManager();
    super.initState();
  }

  ClusterManager _initClusterManager() {
    return ClusterManager<Place>(itemsList, _updateMarkers,
        markerBuilder: _markerBuilder,
        initialZoom: _parisCameraPosition.zoom,
        stopClusteringZoom: 17.0);
  }

  void _updateMarkers(Set<Marker> markers) {
    print('Updated ${markers.length} markers');
    setState(() {
      this.markers = markers;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dynamic screenHeight = MediaQuery.of(context).size.height;
    final appBar = AppBar();
    print(screenHeight);
    print(appBar.preferredSize.height);
    print(MediaQuery.of(context).padding.bottom);
    print(MediaQuery.of(context).padding.top);
    print(screenHeight -
        MediaQuery.of(context).padding.bottom -
        MediaQuery.of(context).padding.top -
        30 -
        appBar.preferredSize.height);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: appBar.preferredSize.height),
            Container(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Search Location',
                    suffixIcon: Icon(
                      Icons.search,
                    ),
                  ),
                  onChanged: (val) => sl<MapManager>().inSearchTerm.add(val),
                ),
              ),
            ),
            Stack(
              children: [
                Container(
                    height: screenHeight -
                        MediaQuery.of(context).padding.top -
                        50 -
                        32 -
                        appBar.preferredSize.height,
                    child: StreamBuilder(
                      stream: sl<MapManager>().currentLocation$,
                      // ignore: lines_longer_than_80_chars
                      builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                            return const Text('Select lot');
                          case ConnectionState.waiting:
                            return const CircularProgressIndicator();
                          case ConnectionState.active:
                            return showMap(snapshot.data!); // ignore: lines_longer_than_80_chars
                          case ConnectionState.done:
                            return Text(
                              '${snapshot.data} (closed)',
                            );
                        }
                      },
                    )),
                StreamBuilder(
                  stream: sl<MapManager>().searchPlaceResult$,
                  // ignore: lines_longer_than_80_chars
                  builder: (BuildContext context, AsyncSnapshot<List<PlaceSearch>> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return const Text('Select lot');
                      case ConnectionState.waiting:
                        return const Text('');
                      case ConnectionState.active:
                        return searchResultBckgd(snapshot.data!, screenHeight,
                            appBar); // ignore: lines_longer_than_80_chars
                      case ConnectionState.done:
                        return Text(
                          '${snapshot.data} (closed)',
                        );
                    }
                  },
                ),
                StreamBuilder(
                  stream: sl<MapManager>().searchPlaceResult$,
                  // ignore: lines_longer_than_80_chars
                  builder: (BuildContext context, AsyncSnapshot<List<PlaceSearch>> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return const Text('Select lot');
                      case ConnectionState.waiting:
                        return const Text('');
                      case ConnectionState.active:
                        return showResultList(snapshot.data!, screenHeight,
                            appBar); // ignore: lines_longer_than_80_chars
                      case ConnectionState.done:
                        return Text(
                          '${snapshot.data} (closed)',
                        );
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget showMap(Position data) {
    return GoogleMap(
        myLocationEnabled: true,
        initialCameraPosition: _parisCameraPosition,
        markers: markers,
        /* initialCameraPosition: CameraPosition(
          target: LatLng(
            data.latitude,
            data.longitude,
          ),
          zoom: 14),*/
        onMapCreated: (GoogleMapController controller) {
          _mapController.complete(controller);
          _manager.setMapController(controller);
        },
        onCameraMove: _manager.onCameraMove,
        onCameraIdle: _manager.updateMap);
  }

  Widget searchResultBckgd(List<PlaceSearch> data, dynamic sHt, AppBar appBar) {
    if (data.isNotEmpty) {
      return Container(
        height: sHt - MediaQuery.of(context).padding.top - 50 - 32 - appBar.preferredSize.height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(.6),
          backgroundBlendMode: BlendMode.darken,
        ),
      );
    } else {
      return const Text('');
    }
  }

  Widget showResultList(List<PlaceSearch> data, dynamic sH, AppBar appBar) {
    if (data.isNotEmpty) {
      return Container(
        height: 500.0,
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                data[index].description!, // ignore: lines_longer_than_80_chars
                style: const TextStyle(color: Colors.white),
              ),
              onTap: () {
                logger.d(data);
                logger.d(data[index].place_id); // ignore: lines_longer_than_80_chars
                sl<MapManager>().inPlaceID.add(data[index].place_id!);
                sl<MapManager>().inSearchTerm.add('');
              },
            );
          },
        ),
      );
    } else {
      return const Text('');
    }
  }

  Future<void> _goToPLace(Place place) async {
    logger.d(place.geometry!.location!.lat);
    logger.d(place.geometry!.location!.lng);

    final controller = await _mapController.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            place.geometry!.location!.lat!,
            place.geometry!.location!.lng!,
          ),
          zoom: 14.0,
        ),
      ),
    );
  }

  Future<Marker> Function(Cluster<Place>) get _markerBuilder => (cluster) async {
        return Marker(
          markerId: MarkerId(cluster.getId()),
          position: cluster.location,
          onTap: () {
            print('---- $cluster');
            cluster.items.forEach((p) => print(p!.name));
          },
          infoWindow: InfoWindow(
            title: cluster.items.first!.name,
          ),
          /*  icon: await BitmapDescriptor.fromAssetImage(
                const ImageConfiguration(size:  Size(48, 48)), 'assets/images/icon.png')*/
          icon: await _getMarkerBitmap(cluster.isMultiple ? 125 : 75,
              text: cluster.isMultiple ? cluster.count.toString() : null),
        );
      };

  Future<BitmapDescriptor> _getMarkerBitmap(int size, {String? text}) async {
    // if (kIsWeb) size = (size / 2).floor();

    final pictureRecorder = PictureRecorder();
    final canvas = Canvas(pictureRecorder);
    final paint1 = Paint()..color = markerColor;
    final paint2 = Paint()..color = Colors.white;

    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.0, paint1);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.2, paint2);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.8, paint1);

    if (text != null) {
      final painter = TextPainter(textDirection: TextDirection.ltr);
      painter.text = TextSpan(
        text: text,
        style: TextStyle(
          fontSize: size / 3,
          color: Colors.white,
          fontWeight: FontWeight.normal,
        ),
      );
      painter.layout();
      painter.paint(
        canvas,
        Offset(size / 2 - painter.width / 2, size / 2 - painter.height / 2),
      );
    }

    final img = await pictureRecorder.endRecording().toImage(size, size);
    final data = await img.toByteData(format: ImageByteFormat.png) as ByteData;

    return BitmapDescriptor.fromBytes(data.buffer.asUint8List());
  }
}
