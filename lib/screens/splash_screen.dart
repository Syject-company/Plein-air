import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plein_air_club/helpers/constants.dart';
import 'package:plein_air_club/screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String id = '/splash_screen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => OnboardingScreen())));
  }

  @override
  Widget build(BuildContext context) {
    final dynamic screenHeight = MediaQuery.of(context).size.height;
    final dynamic screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
             Center(
               child: Container(
                 height: screenHeight * .22,
                 child: Column(
                   children: [
                     SizedBox(
                         width: screenWidth * .15,
                         height: screenHeight * .08,
                         child: Image.asset('assets/images/icon.png')),
                     SizedBox(
                         width: screenWidth * .45,
                         height: 56,
                         child: Image.asset('assets/images/textIcon.png')),
                   ],
                 ),
               ),
             ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: screenHeight * .15),
                  child: const CircularProgressIndicator(),
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: screenHeight * .08),
                child: const Text(
                  'Copyright © All Rights Reserved',
                  style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                    color: kTextColor,
                  ),
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: screenHeight * .06),
                  child: const Text(
                    'PLEINAIRCLUB 2021',
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w700,
                      color: kTextColor,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
