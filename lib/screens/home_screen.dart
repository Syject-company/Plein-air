import 'package:flutter/material.dart';
import 'package:plein_air_club/helpers/constants.dart';
import 'package:plein_air_club/helpers/location_command.dart';
import 'package:plein_air_club/managers/home_manager.dart';
import 'package:plein_air_club/widgets/buttons_category_widget.dart';
import 'package:plein_air_club/widgets/featured_widget.dart';
import 'package:plein_air_club/widgets/navigation_engine.dart';
import 'package:plein_air_club/widgets/news_widget.dart';
import 'package:plein_air_club/widgets/trending_widget.dart';

import '../service_locator.dart';

class HomeScreen extends StatefulWidget {
  static const String id = '/home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final dynamic screenHeight = MediaQuery.of(context).size.height;
    final dynamic screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      /* appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),*/
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.039),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                onTap: () {
                  _showBottomSheet(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: greySearchColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 4.0,
                    ),
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search Location',
                        suffixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ButtonsCategory(),
            FeaturedWidget(),
            TrendingWidget(),
            NewsWidget(),
            SizedBox(height: screenHeight * 0.043),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NavigationEngine(currentIndex: 2),
                    ),
                  );
                },
                child: Container(
                  width: screenWidth - 16,
                  decoration: BoxDecoration(
                    border: Border.all(color: primaryColor),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 20.0,
                    ),
                    child: Text(
                      'Show All Social Wall',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.08),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    sl<HomeManager>().inFeaturedRequest.add(RequestCommand.START);
    sl<HomeManager>().inTrendingRequest.add(RequestCommand.START);
    sl<HomeManager>().inNewsRequest.add(RequestCommand.START);
    super.initState();
  }
}

void _showBottomSheet(BuildContext context) async {
  final dynamic screenHeight = MediaQuery.of(context).size.height;
  final dynamic screenWidth = MediaQuery.of(context).size.width;
  const style = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: kTextBlackColor2,
  );
  final heightIcon = screenHeight * 0.08;
  final heightSizebox = screenHeight * 0.02;
  final heightCheckbox = screenHeight * 0.03;
  final heightCheckbox2 = screenHeight * 0.06;
  bool _atr = false;
  bool _access = false;
  bool _animal = false;
  bool _acqua = false;
  bool _pozzeto = false;
  bool _electric = false;

  return showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      backgroundColor: Colors.white,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (
          BuildContext context,
          StateSetter state,
        ) {
          return SingleChildScrollView(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 8),
                child: Row(
                  children: [
                    IconButton(
                        icon: const Icon(
                          Icons.arrow_back_sharp,
                          color: primaryColor,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    SizedBox(width: screenWidth * 0.26),
                    const Text(
                      'Filter Result',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: kTextBlackColor,
                      ),
                    ),
                  ],
                ),
              ),
              Container(height: 1, color: lineColor),
              SizedBox(height: screenHeight * 0.015),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Container(
                      height: heightCheckbox2,
                      decoration: BoxDecoration(
                        color: greySearchColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 4.0,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search Location',
                            suffixIcon: Icon(Icons.search),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: heightCheckbox2,
                      decoration: BoxDecoration(
                        color: greySearchColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 4.0,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search Location',
                            suffixIcon: Icon(Icons.search),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Container(height: 1, color: lineColor),
              SizedBox(height: screenHeight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/images/camp.png',
                          height: heightIcon,
                          //width: screenWidth * 0.1,
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
                          height: heightIcon,
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
                          height: heightIcon,
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
                          height: heightIcon,
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
              SizedBox(height: screenHeight * 0.02),
              Container(height: 1, color: lineColor),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Other Filters',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: greyTextColor,
                      ),
                    ),
                    SizedBox(height: heightSizebox),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Attrazioni', style: txtCheckBoxStyle),
                              Container(
                                height: heightCheckbox,
                                child: Checkbox(
                                  onChanged: (bool? value) {
                                    state(() {
                                      _atr = value!;
                                    });
                                  },
                                  value: _atr,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: heightSizebox),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Accessibilità disabili',
                                style: txtCheckBoxStyle,
                              ),
                              Container(
                                height: heightCheckbox,
                                child: Checkbox(
                                  onChanged: (bool? value) {
                                    state(() {
                                      _access = value!;
                                    });
                                  },
                                  value: _access,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: heightSizebox),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Animali ammessi',
                                style: txtCheckBoxStyle,
                              ),
                              Container(
                                height: heightCheckbox,
                                child: Checkbox(
                                  onChanged: (bool? value) {
                                    state(() {
                                      _animal = value!;
                                    });
                                  },
                                  value: _animal,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: heightSizebox),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Acqua', style: txtCheckBoxStyle),
                              Container(
                                height: heightCheckbox,
                                child: Checkbox(
                                  onChanged: (bool? value) {
                                    state(() {
                                      _acqua = value!;
                                    });
                                  },
                                  value: _acqua,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: heightSizebox),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Pozzetto', style: txtCheckBoxStyle),
                              Container(
                                height: heightCheckbox,
                                child: Checkbox(
                                  onChanged: (bool? value) {
                                    state(() {
                                      _pozzeto = value!;
                                    });
                                  },
                                  value: _pozzeto,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: heightSizebox),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Elettricità',
                                style: txtCheckBoxStyle,
                              ),
                              Container(
                                height: heightCheckbox,
                                child: Checkbox(
                                  onChanged: (bool? value) {
                                    state(() {
                                      _electric = value!;
                                    });
                                  },
                                  value: _electric,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: screenHeight * 0.015,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: screenWidth - kDefaultPadding,
                height: screenHeight * 0.083,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: gradient,
                  ),
                  child: ElevatedButton(
                    style: styleButton,
                    onPressed: () {
                      // _trySubmit();
                    },
                    child: const Text(
                      'Apply FIlter',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
            ],
          ));
        });
      });
}

void openFilter(BuildContext context) {
  final dynamic screenHeight = MediaQuery.of(context).size.height;
  final dynamic screenWidth = MediaQuery.of(context).size.width;

  final styleButton = ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
    ),
    backgroundColor: MaterialStateProperty.all(Colors.transparent),
    shadowColor: MaterialStateProperty.all(Colors.transparent),
  );

  const style = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: kTextBlackColor2,
  );

  print(screenHeight);
  final _formKey = GlobalKey<FormState>();
/*
  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
      sl<TrialManager>().inRequest.add(input);

      sl<TrialManager>().freeTrialResult$.listen((event) {
        logger.d(event);
        if (event.status == 'OK') {
          Navigator.of(context).pop();
          openTialPassword(context);
        }else if(event.status == 'KO'){
          openErrorMessage(context, event.message! );
        }
      });
    }
  }*/

  showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext bc) {
        return Wrap(
          children: [
            CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  snap: true,
                  forceElevated: true,
                  elevation: 1,
                  floating: true,
                  title: const Text(
                    'Filter Result',
                    style: TextStyle(
                      color: kTextBlackColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  centerTitle: true,
                  iconTheme: IconThemeData(
                    color: Theme.of(context).primaryColor,
                  ),
                  backgroundColor: Colors.white,
                  foregroundColor: Theme.of(context).primaryColor,
                ),
                SliverList(
                    delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Form(
                      key: _formKey,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: screenHeight * 0.06),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset(
                                        'assets/images/camp.png',
                                        height: screenHeight * 0.055,
                                        width: screenWidth * 0.1,
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
                                        height: screenHeight * 0.055,
                                        width: screenWidth * 0.1,
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
                                        height: screenHeight * 0.055,
                                        width: screenWidth * 0.1,
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
                                        height: screenHeight * 0.055,
                                        width: screenWidth * 0.1,
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
                            SizedBox(
                              width: screenWidth - kDefaultPadding,
                              height: screenHeight * 0.083,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  gradient: gradient,
                                ),
                                child: ElevatedButton(
                                  style: styleButton,
                                  onPressed: () {
                                    // _trySubmit();
                                  },
                                  child: const Text(
                                    'Apply FIlter',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]))
              ],
            ),
          ],
        );
      });
}
