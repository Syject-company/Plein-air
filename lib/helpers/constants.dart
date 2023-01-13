import 'package:flutter/material.dart';

const kTextColor = Color(0xFF666666);
const kTextGreyColor = Color(0xFFF2F2F2);
const kTextBlackColor = Color(0xFF1C1C1C);
const kTitleTextBlackColor = Color(0xFF1A1A1A);
const kTextBlackColor2 = Color(0xFF333333);
const primaryColor = Color(0xFF01867E);
const blueColor = Color(0xFF003586);
const greenColor = Color(0xFF029387);
const errorColor = Color(0xFFD47979);
const greyColor = Color(0xFFf5f5f5);
const greySearchColor = Color(0xFFF2F2F2);
const starColor = Color(0xFFF0AD34);
const starGreyColor = Color(0xFFCCCCCC);
const separatorColor = Color(0xFFD9D9D9);
const borderColor = Color(0xFF1A1A1A);
const markerColor = Color(0xFFF2C12D);
const lineColor = Color(0xFFCCCCCC);
const greyTextColor = Color(0xFF999999);

const greenGr1 = Color(0xFF01A196);
const greenGr2 = Color(0xFF057569);
const greenGr3 = Color(0xFF057569);

const gradient = LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  colors: <Color>[Color(0xff01A196), Color(0xff057569), Color(0xff057569)],
  stops: [0, 1, 0],
);

const Map<int, Color> color = {
  50: Color.fromRGBO(1, 134, 126, .1),
  100: Color.fromRGBO(1, 134, 126, .2),
  200: Color.fromRGBO(1, 134, 126, .3),
  300: Color.fromRGBO(1, 134, 126, .4),
  400: Color.fromRGBO(1, 134, 126, .5),
  500: Color.fromRGBO(1, 134, 126, .6),
  600: Color.fromRGBO(1, 134, 126, .7),
  700: Color.fromRGBO(1, 134, 126, .8),
  800: Color.fromRGBO(1, 134, 126, .9),
  900: Color.fromRGBO(1, 134, 126, 1),
};
const MaterialColor kPrimaryColor = MaterialColor(0xFF01867E, color);

const kDefaultPadding = 16.0;

const kGoogleApiKey = 'AIzaSyDZkJzeIJ-KhgLPt-h2hPV9xll4iV_T184';

const emailReg = '^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]';

final styleButton = ElevatedButton.styleFrom(
  primary: Colors.transparent, // background
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
);

const txtHomeTitleStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w700,
  color: kTextBlackColor2,
);

const txtHomeAddressStyle = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w500,
  color: Color(0xFF999999),
);

const txtHomeCategoryStyle = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w500,
  color: kTextBlackColor2,
);

const txtCheckBoxStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: kTextBlackColor2,
);
