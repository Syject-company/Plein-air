import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:plein_air_club/helpers/constants.dart';
import 'package:plein_air_club/managers/home_manager.dart';
import 'package:plein_air_club/models/trending.dart';

import '../service_locator.dart';

class TrendingWidget extends StatelessWidget {
  TrendingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dynamic screenHeight = MediaQuery.of(context).size.height;
    final dynamic screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: StreamBuilder(
        stream: sl<HomeManager>().getTrendingResult$,
        builder: (BuildContext ctx, AsyncSnapshot<List<Trending>> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Text('Select lot');
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.active:
              return _showTrending(
                  snapshot.data, screenWidth, screenHeight); // ignore: lines_longer_than_80_chars
            case ConnectionState.done:
              return Text(
                '${snapshot.data} (closed)',
              );
          }
        },
      ),
    );
  }
}

Widget _showTrending(List<Trending>? data, double screenWidth, double screenHeight) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Trending POIs',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: kTextBlackColor2,
              ),
            ),
            Text(
              'See All',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: primaryColor,
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 24),
      CarouselSlider.builder(
        itemCount: data!.length,
        options: CarouselOptions(
          viewportFraction: 0.9,
          height: screenHeight * 0.40,
        ),
        itemBuilder: (ctx, index, realIdx) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl:
                    'https://i.pinimg.com/236x/fa/e3/63/fae36399f39b90e30e2c709700ab73f3--nature-mountain-bike.jpg',
                imageBuilder: (context, imageProvider) => Container(
                  height: screenHeight * 0.25,
                  width: screenWidth * 0.87,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                data[index].nome_poi ?? '',
                style: txtHomeTitleStyle,
              ),
              const SizedBox(height: 16),
              Text(
                data[index].citta_poi ?? '',
                style: txtHomeAddressStyle,
              ),
              Text(
                _getCategory(data[index]),
                style: txtHomeCategoryStyle,
              ),
            ],
          );
        },
      ),
    ],
  );
}

String _getCategory(Trending data) {
  if (data.CON == '1') {
    return 'Vantaggi  del Club';
  }
  if (data.SOS == '1') {
    return 'Aree Sosta';
  }
  if (data.SER == '1') {
    return 'Aree Servizi';
  }
  if (data.CAM == '1') {
    return 'Campeggi';
  }
  if (data.ATT == '1') {
    return 'Attrazioni';
  }

  return '';
}
