import 'package:flutter/material.dart';
import 'package:plein_air_club/helpers/constants.dart';
import 'package:plein_air_club/screens/home_screen.dart';
import 'package:plein_air_club/screens/map_screen.dart';
import 'package:plein_air_club/screens/wall_screen.dart';

class NavigationEngine extends StatefulWidget {

  NavigationEngine({Key? key, required this.currentIndex})
      : super(key: key);
  final int currentIndex;
  @override
  _NavigationEngineState createState() => _NavigationEngineState();
}

class _NavigationEngineState extends State<NavigationEngine> {
   int _currentIndex = 0;
  final widgetOptions = [
    HomeScreen(),
    MapScreen(),
    WallScreen(),
    const Text('The Card Screen'),
    const Text('The Profile Screen'),
  ];

  @override
  void initState() {
    _currentIndex = widget.currentIndex;
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        fixedColor: kPrimaryColor,
        unselectedItemColor: kTextColor,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
        items:  const <BottomNavigationBarItem>[
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

      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          // your navigation pages
          HomeScreen(),
          MapScreen(),
          WallScreen(),
          const Text('The Card Screen'),
          const Text('The Profile Screen'),
        ],
      ),
    );
  }
}