import 'package:flutter/material.dart';
import 'package:plein_air_club/helpers/location_command.dart';
import 'package:plein_air_club/screens/main_screen.dart';
import 'package:plein_air_club/screens/login_screen.dart';
import 'package:plein_air_club/screens/map_screen.dart';
import 'package:plein_air_club/screens/onboarding_screen.dart';
import 'package:plein_air_club/screens/password_screen.dart';
import 'package:plein_air_club/screens/poi_details.dart';
import 'package:plein_air_club/screens/poi_list_screen.dart';
import 'package:plein_air_club/screens/splash_screen.dart';
import 'package:plein_air_club/screens/wall_screen.dart';
import 'package:plein_air_club/service_locator.dart';

import 'helpers/constants.dart';
import 'managers/map_manger.dart';
import 'managers/poi_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Setup GetIt service locator
  setUpServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    sl<MapManager>().inRequest.add(RequestCommand.START);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: kPrimaryColor,
        fontFamily: 'UberMove',
      ),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        OnboardingScreen.id: (context) => OnboardingScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        PasswordScreen.id: (context) => PasswordScreen(),
        MainScreen.id: (context) => MainScreen(),
        MapScreen.id: (context) => MapScreen(),
        POIListScreen.id: (context) => POIListScreen(),
        POIDetails.id: (context) => POIDetails(),
        WallScreen.id: (context) => WallScreen(),
      },
    );
  }

  @override
  void dispose() {
    sl<MapManager>().dispose();
    sl<PoiManager>().dispose();
    super.dispose();
  }
}
