import 'package:flutter/material.dart';
import 'package:plein_air_club/helpers/constants.dart';
import 'package:plein_air_club/helpers/location_command.dart';
import 'package:plein_air_club/managers/poi_manager.dart';
import 'package:plein_air_club/screens/home_screen.dart';
import 'package:plein_air_club/screens/map_screen.dart';
import 'package:plein_air_club/screens/poi_list_screen.dart';
import 'package:plein_air_club/screens/wall_screen.dart';
import 'package:provider/provider.dart';

import '../service_locator.dart';

class MainScreen extends StatefulWidget {
  static const String id = '/main_screen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  final widgetOptions = [
    HomeScreen(),
    MapScreen(),
    WallScreen(),
    const Text('The Card Screen'),
    const Text('The Profile Screen'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_bulleted_sharp),
            label: 'POI List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_sharp),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business_sharp),
            label: 'Wall',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card_sharp),
            label: 'Card',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.face_sharp),
            label: 'Profile',
          ),
        ],
        currentIndex: selectedIndex,
        fixedColor: kPrimaryColor,
        unselectedItemColor: kTextColor,
        showUnselectedLabels: true,
        onTap: onItemTapped,
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
