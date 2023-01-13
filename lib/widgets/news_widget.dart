import 'package:flutter/material.dart';
import 'package:plein_air_club/helpers/constants.dart';
import 'package:plein_air_club/managers/home_manager.dart';
import 'package:plein_air_club/models/news.dart';
import 'package:url_launcher/url_launcher.dart';

import '../service_locator.dart';

class NewsWidget extends StatelessWidget {
   NewsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dynamic screenHeight = MediaQuery.of(context).size.height;
    final dynamic screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight * 0.4,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: StreamBuilder(
          stream: sl<HomeManager>().getNewsResult$,
          builder: (BuildContext ctx, AsyncSnapshot<List<News>> snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Text('Select lot');
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.active:
                return _showNews(snapshot.data, screenHeight); // ignore: lines_longer_than_80_chars
              case ConnectionState.done:
                return Text(
                  '${snapshot.data} (closed)',
                );
            }
          },
        ),
      ),
    );
  }
}

Widget _showNews(List<News>? data, double screenHeight) {
  return Container(
    height: screenHeight * 0.35,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          ' Latest News',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: kTextBlackColor2,
          ),
        ),
         SizedBox(height: screenHeight *0.006),
        Expanded(
          child:  ListView.builder(
            shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data![index].titolo!,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color: kTextBlackColor2,
                      ),
                    ),
                     SizedBox(height: screenHeight *0.012),
                    Text(
                      data[index].testo!,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: kTextColor,
                      ),
                    ),
                    SizedBox(height: screenHeight *0.024),
                     InkWell(
                      onTap: (){
                      _launchUrl(data[index].link);
                      },
                      child:  const Text(
                        'Read more',
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight *0.0215),

                  ],
                );
              }),
        ),
      ],
    ),
  );
}
 _launchUrl(urlRegistration) async{
   if (await canLaunch(urlRegistration)) {
   await launch(urlRegistration);
   } else {
   throw 'Could not launch $urlRegistration';
   }
}
