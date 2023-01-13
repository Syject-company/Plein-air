import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plein_air_club/helpers/constants.dart';
import 'package:plein_air_club/models/poi.dart';
import 'package:plein_air_club/screens/poi_details.dart';

class ItemCard extends StatelessWidget {
  ItemCard(this.poi);

  final POI poi;
  List<Icon> average = [];

  @override
  Widget build(BuildContext context) {
    final dynamic screenHeight = MediaQuery.of(context).size.height;
    final dynamic screenWidth = MediaQuery.of(context).size.width;
    final result = double.parse(poi.distance!);
    final num1 = double.parse((result).toStringAsFixed(1));

    for (var i = 0; i <= 5; i++) {
      if (i < poi.average!) {
        average.add(
          const Icon(Icons.star_rate_sharp, size: 12, color: starColor),
        );
      } else {
        average.add(
          const Icon(Icons.star_rate_outlined, size: 12, color: starGreyColor),
        );
      }
    }

    return InkWell(
      onTap: () async {
        await Navigator.pushNamed(context, POIDetails.id, arguments: poi);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(12.0),
                ),
                child: Image.network(
                  'https://farm4.staticflickr.com/3614/3403721621_807eb63b8e_z.jpg?zz=1',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(width: 12.0),
            Container(
                width: screenWidth - 160,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      poi.nome_poi!,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: kTitleTextBlackColor,
                      ),
                    ),
                    Text(
                      poi.citta_poi!,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        color: kTitleTextBlackColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      poi.desc_poi!,
                      maxLines: 4,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: const Color(0xFF666666).withOpacity(0.6),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 20,
                          width: 100,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (BuildContext context, int index) {
                                return average[index];
                              }),
                        ),
                        Text(
                          '${num1.toString()} km',
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 12.0,
                            color: kTextColor,
                          ),
                        )
                      ],
                    ),
                    /*   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [

                          average;
                          Icon(Icons.star, size: 12, color: starColor),
                          Icon(Icons.star, size: 12, color: starColor),
                          Icon(Icons.star, size: 12, color: starColor),
                          Icon(Icons.star, size: 12, color: starGreyColor),
                          Icon(Icons.star, size: 12, color: starGreyColor),
                        ],
                      ),*/
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
