import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plein_air_club/helpers/constants.dart';
import 'package:plein_air_club/managers/home_manager.dart';
import 'package:plein_air_club/models/featured.dart';

import '../service_locator.dart';

class FeaturedWidget extends StatelessWidget {
  FeaturedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dynamic screenHeight = MediaQuery.of(context).size.height;
    final dynamic screenWidth = MediaQuery.of(context).size.width;
    print(screenWidth);
    print(screenHeight);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: StreamBuilder(
        stream: sl<HomeManager>().getFeaturedResult$,
        builder: (BuildContext ctx, AsyncSnapshot<List<Featured>> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Text('Select lot');
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.active:
              return _showFeatured(
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

  Widget _showFeatured(
    List<Featured>? data,
    double screenWidth,
    double screenHeight,
  ) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Featured. POIs',
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
            height: screenHeight *0.4,
          ),
          itemBuilder: (ctx, index, realIdx) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl:
                      'https://i.pinimg.com/236x/fa/e3/63/fae36399f39b90e30e2c709700ab73f3--nature-mountain-bike.jpg',
                  imageBuilder: (context, imageProvider) => Container(
                    height: screenHeight *0.25,
                    width: screenWidth * 0.87,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  /*  placeholder: (context, url) => placeholder,
                  errorWidget: (context, url, error) => errorWidget,*/
                ),
                const SizedBox(height: 12),
                Text(
                  data[index].nome_poi ?? '',
                  style: txtHomeTitleStyle,
                ),
                Text(
                  _getCategory(data[index]),
                  style: txtHomeCategoryStyle,
                ),
                const SizedBox(height: 16),
                Text(
                  data[index].indirizzo_poi ?? '',
                  style: txtHomeAddressStyle,
                )
              ],
            );
          },
        ),
      ],
    );
  }
}

String _getCategory(Featured data) {
  if (data.cat_convenzioni == '1') {
    return 'Vantaggi  del Club';
  }
  if (data.cat_areesosta == '1') {
    return 'Aree Sosta';
  }
  if (data.cat_areeservizio == '1') {
    return 'Aree Servizi';
  }
  if (data.cat_camping == '1') {
    return 'Campeggi';
  }
  if (data.cat_attrazioni == '1') {
    return 'Attrazioni';
  }

  return '';
}
