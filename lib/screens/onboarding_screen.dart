import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:plein_air_club/helpers/constants.dart';
import 'package:plein_air_club/managers/trial_manager.dart';
import 'package:plein_air_club/models/trial_input.dart';
import 'package:plein_air_club/screens/login_screen.dart';
import 'package:plein_air_club/screens/main_screen.dart';

import '../service_locator.dart';

final logger = Logger();

class OnboardingScreen extends StatefulWidget {
  static const String id = '/onboarding_screen';

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  static const String header =
      'Passion for the camper & for traveling according to nature'; // ignore: lines_longer_than_80_chars
  static const String desc = 'Join the Club and let\'s travel together! ';

  @override
  Widget build(BuildContext context) {
    final style = ElevatedButton.styleFrom(
      primary: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
    );
    final styleLogin = ElevatedButton.styleFrom(
      primary: Colors.white,
      // background
      onPrimary: Colors.black,
      // foreground
      side: BorderSide(color: Theme.of(context).primaryColor),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
    );
    final width = MediaQuery.of(context).size.width - 10;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 7,
              child: Container(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(25.0),
                    bottomLeft: Radius.circular(25.0),
                  ),
                  child: Image.asset(
                    'assets/images/preLogin.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              )),
          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          header,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      const Text(
                        desc,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: kTextColor,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 56,
                            width: width / 2 - kDefaultPadding,
                            child: ElevatedButton(
                              style: styleLogin,
                              onPressed: () async {
                                await Navigator.pushNamed(
                                  context,
                                  LoginScreen.id,
                                );
                              },
                              child: const Text('Login'),
                            ),
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: width / 2 - kDefaultPadding,
                            height: 56,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                gradient: gradient,
                              ),
                              child: ElevatedButton(
                                style: styleButton,
                                onPressed: () {
                                  openTialActivate(context);
                                },
                                child: const Text(
                                  '48 Hours Free Trial',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

void openTialActivate(BuildContext context) {
  final dynamic screenHeight = MediaQuery.of(context).size.height;
  final dynamic screenWidth = MediaQuery.of(context).size.width;
  final style = ElevatedButton.styleFrom(
    primary: Colors.transparent, // background
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
  );
  print(screenHeight);
  final _formKey = GlobalKey<FormState>();
  var input = TrialInput();

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
        } else if (event.status == 'KO') {
          openErrorMessage(context, event.message!);
        }
      });
    }
  }

  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                snap: true,
                forceElevated: true,
                floating: true,
                title: const Text(
                  'Free Trial',
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
                          const Text(
                            'Active Your Free Trial',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          const Text(
                            'You can user the App for 48 hours',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: kTextColor,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.07),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Insert your e-mail',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: kTextColor,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: kTextGreyColor,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        hintText: 'E-Mail',
                                      ),
                                      validator: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your e-mail';
                                        }
                                        if (!RegExp(emailReg).hasMatch(value)) {
                                          return 'Please enter a valid email';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        input.email = value!;
                                        input.udid = '12345';
                                      }),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.03),
                          SizedBox(
                            width: screenWidth - kDefaultPadding,
                            height: screenHeight * 0.083,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12), gradient: gradient),
                              child: ElevatedButton(
                                style: style,
                                onPressed: () {
                                  _trySubmit();
                                },
                                child: const Text(
                                  'Continue',
                                  style: TextStyle(color: Colors.white),
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
        );
      });
}

void openTialPassword(BuildContext context) {
  final dynamic screenHeight = MediaQuery.of(context).size.height;
  final dynamic screenWidth = MediaQuery.of(context).size.width;
  final style = ElevatedButton.styleFrom(
    primary: Colors.transparent, // background
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
  );
  print(screenHeight);
  final _formKey2 = GlobalKey<FormState>();
  String? hash;
  void _trySubmit() {
    final isValid = _formKey2.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey2.currentState!.save();

      sl<TrialManager>().inActivateRequest.add(hash!);
      sl<TrialManager>().activateResult$.listen((event) {
        logger.d(event);
        if (event.status == 'OK') {
          Navigator.of(context).pop();
          openTialActivated(context);
        }
      });
    }
  }

  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                snap: true,
                forceElevated: true,
                floating: true,
                title: const Text(
                  'Free Trial',
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
                    key: _formKey2,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: screenHeight * 0.06),
                          const Text(
                            'We sent a mail with your password ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          const Text(
                            'If you don’t get the email check the SPAM folder or '
                            'click the back button to repeat the procedure.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: kTextColor,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.05),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Insert password sent',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: kTextColor,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: kTextGreyColor,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        hintText: 'Password',
                                      ),
                                      validator: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'Please insert password sent';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        hash = value!;
                                      }),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.04),
                          SizedBox(
                            width: screenWidth - kDefaultPadding,
                            height: screenHeight * 0.083,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                gradient: const LinearGradient(
                                  colors: [greenGr1, greenGr2, greenGr3],
                                  begin: FractionalOffset.centerRight,
                                  end: FractionalOffset.centerLeft,
                                ),
                              ),
                              child: ElevatedButton(
                                style: style,
                                onPressed: () {
                                  _trySubmit();
                                },
                                child: const Text(
                                  'Continue',
                                  style: TextStyle(color: Colors.white),
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
        );
      });
}

void openTialActivated(BuildContext context) {
  final dynamic screenHeight = MediaQuery.of(context).size.height;
  final dynamic screenWidth = MediaQuery.of(context).size.width;
  final style = ElevatedButton.styleFrom(
    primary: Colors.transparent,
    onPrimary: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
  );
  print(screenHeight);

  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                snap: true,
                forceElevated: true,
                floating: true,
                title: const Text(
                  'Free Trial',
                  style: TextStyle(
                    color: kTextBlackColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                centerTitle: true,
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColor,
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: screenHeight * 0.04),
                        const Opacity(
                          opacity: 0.35,
                          child: CircleAvatar(
                              backgroundColor: greenColor,
                              radius: 40,
                              child: Icon(
                                Icons.done,
                                color: Colors.white,
                                size: 40,
                              )),
                        ),
                        SizedBox(height: screenHeight * 0.04),
                        const Text(
                          'Thank You!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 50.0),
                          child: Text(
                            'You have activated your Free Trial'
                            'after 48 hours the trial will expire.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: kTextColor,
                              fontSize: 14.5,
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.05),
                        const Text(
                          // ignore: lines_longer_than_80_chars
                          'For any kind of help or question contact our costumer '
                          // ignore: lines_longer_than_80_chars
                          'service at 0685305377 or write to info@pleinairclub.it',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: kTextColor,
                            fontSize: 11.5,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        SizedBox(
                          width: screenWidth - kDefaultPadding,
                          height: screenHeight * 0.083,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              gradient: gradient,
                            ),
                            child: ElevatedButton(
                              style: style,
                              onPressed: () async {
                                await Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  MainScreen.id,
                                  ModalRoute.withName(MainScreen.id),
                                );
                              },
                              child: const Text(
                                'Go to Home',
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
              ]))
            ],
          ),
        );
      });
}

void openErrorMessage(BuildContext context, String errorMessage) {
  final dynamic screenHeight = MediaQuery.of(context).size.height;
  final dynamic screenWidth = MediaQuery.of(context).size.width;
  final style = ElevatedButton.styleFrom(
    primary: Colors.transparent,
    onPrimary: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
  );
  print(screenHeight);

  showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                  delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: screenHeight * 0.15),
                        const Text(
                          'OPS',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 26,
                            color: kTextBlackColor2,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        const Opacity(
                            opacity: 0.24,
                            child: CircleAvatar(
                              backgroundColor: errorColor,
                              radius: 80,
                              child: Text('!'),
                            )),
                        SizedBox(height: screenHeight * 0.1),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50.0),
                          child: Text(
                            errorMessage,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: kTextColor,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.1),
                        SizedBox(
                          width: screenWidth - kDefaultPadding,
                          height: screenHeight * 0.083,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              gradient: gradient,
                            ),
                            child: ElevatedButton(
                              style: style,
                              onPressed: () async {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'Back',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.1),
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'For any kind of help or requests call \n '
                            '0685305377 or write to info@pleinairclub.it',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: kTextColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]))
            ],
          ),
        );
      });
}
