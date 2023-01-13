import 'package:flutter/material.dart';
import 'package:plein_air_club/helpers/constants.dart';

class ButtonsCategory extends StatefulWidget {
  ButtonsCategory({Key? key}) : super(key: key);

  @override
  _ButtonsCategoryState createState() => _ButtonsCategoryState();
}

class _ButtonsCategoryState extends State<ButtonsCategory> {
  @override
  Widget build(BuildContext context) {
    final dynamic screenHeight = MediaQuery.of(context).size.height;
    final dynamic screenWidth = MediaQuery.of(context).size.width;
    const style = TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: kTextBlackColor2,
    );
    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.01),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images/camp.png',
                      height: screenHeight * 0.12,
                      width: screenWidth * 0.22,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.008),
                  const Text(
                    'Campeggi',
                    style: style,
                  )
                ],
              ),
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images/service.png',
                      height: screenHeight * 0.12,
                      width: screenWidth * 0.22,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.008),
                  const Text(
                    'Aree Servizi',
                    style: style,
                  )
                ],
              ),
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images/sosta.png',
                      height: screenHeight * 0.12,
                      width: screenWidth * 0.22,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.008),
                  const Text(
                    'Aree Sosta',
                    style: style,
                  )
                ],
              ),
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images/club.png',
                      height: screenHeight * 0.12,
                      width: screenWidth * 0.22,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.008),
                  const Text(
                    'Vantaggi  del Club',
                    style: style,
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: screenWidth / 2 - 12,
                decoration: BoxDecoration(
                  border: Border.all(color: primaryColor),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Padding(
                  padding:  EdgeInsets.symmetric(vertical: 20.0),
                  child:  Center(
                    child: Text(
                      'Attrazioni',
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: screenWidth / 2 - 12 ,
                decoration: BoxDecoration(
                  border: Border.all(color: blueColor,),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Padding(
                  padding:  EdgeInsets.symmetric(vertical: 20.0),
                  child:  Center(
                    child: Text(
                      'Allianz',
                      style: TextStyle(
                        color: blueColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.03),
          Container(
            color: lineColor,
            height: 0.5,
          ),
          SizedBox(height: screenHeight * 0.03),

        ],
      ),
    );
  }
}
