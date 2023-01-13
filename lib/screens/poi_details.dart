import 'package:flutter/material.dart';
import 'package:plein_air_club/models/poi.dart';

class POIDetails extends StatefulWidget {
  static const String id = '/poi_details_screen';

  @override
  _POIDetailsState createState() => _POIDetailsState();
}

class _POIDetailsState extends State<POIDetails> {
  @override
  Widget build(BuildContext context) {
    final poi = ModalRoute.of(context)!.settings.arguments as POI;

    return Scaffold(
      appBar: AppBar(

        title: Text("poi.nome_poi!"),
      ),
    );
  }
}
