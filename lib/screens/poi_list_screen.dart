import 'package:flutter/material.dart';
import 'package:plein_air_club/helpers/constants.dart';
import 'package:plein_air_club/helpers/location_command.dart';
import 'package:plein_air_club/managers/home_manager.dart';
import 'package:plein_air_club/managers/poi_manager.dart';
import 'package:plein_air_club/models/poi.dart';
import 'package:plein_air_club/widgets/item_card.dart';

import '../service_locator.dart';

class POIListScreen extends StatefulWidget {
  static const String id = '/poi_list_screen';

  @override
  _POIListScreenState createState() => _POIListScreenState();
}

class _POIListScreenState extends State<POIListScreen> {
  bool _showMe = false;

  @override
  void initState() {
    sl<PoiManager>().inRequest.add(RequestCommand.START);
    sl<HomeManager>().inTrendingRequest.add(RequestCommand.START);

    sl<PoiManager>().poiListResult$.listen((event) {
        if(event.isNotEmpty){
          setState(() {
            _showMe = true;
          });
        }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final styleLogin = ElevatedButton.styleFrom(
      primary: Colors.white,
      // background
      onPrimary: Colors.black,
      // foreground
      side: const BorderSide(color: borderColor),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
       /* leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, false),
        ),*/
        title: const Text(
          'Search POI',
          style: TextStyle(
            color: kTitleTextBlackColor,
            fontWeight: FontWeight.w700,
            fontSize: 16.0,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        backgroundColor: Colors.white,
        foregroundColor: Theme.of(context).primaryColor,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 24.0),
            child: Center(
              child: Text(
                'Map View',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: greySearchColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 4.0,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search Location',
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
            ),
            StreamBuilder(
              stream: sl<PoiManager>().poiListResult$,
              builder:(BuildContext ctx, AsyncSnapshot<List<POI>> snapshot){
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return const Text('Select lot');
                  case ConnectionState.waiting:
                    return const Center(child: CircularProgressIndicator());
                  case ConnectionState.active:
                    return _showList(snapshot.data); // ignore: lines_longer_than_80_chars
                  case ConnectionState.done:
                    return Text(
                      '${snapshot.data} (closed)',
                    );
                }
              },
            ),
            Visibility(
              visible: _showMe,
              child: Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: SizedBox(
                  height: 56,
                  width: double.maxFinite - kDefaultPadding,
                  child: ElevatedButton(
                    style: styleLogin,
                    onPressed: () async {
                    },
                    child: const Text('Carica altri 10 risultati'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _showList(List<POI>? data) {

    return ListView.separated(
        shrinkWrap: true,
        primary: false,
        itemCount: data!.length,
        itemBuilder: (context, index) {
          return ItemCard(data[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(
              color: separatorColor,
            ),
          );
        });
  }
}
