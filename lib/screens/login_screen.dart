import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:plein_air_club/helpers/constants.dart';
import 'package:plein_air_club/managers/login_manager.dart';
import 'package:plein_air_club/models/login_input.dart';
import 'package:plein_air_club/screens/main_screen.dart';
import 'package:plein_air_club/screens/password_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../service_locator.dart';

class LoginScreen extends StatefulWidget {
  static const String id = '/login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _showPassword = false;
  var input = LoginInput();

  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  final _formKey = GlobalKey<FormState>();
  final GlobalKey _textKey = new GlobalKey();
  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
      sl<LoginManager>().inRequest.add(input);

      sl<LoginManager>().loginResult$.listen((event) {
        if (event.can_login == 1) {
          loginConfirmation(context);
        } else if (event.can_login == 0) {
          //Error message
        }
      });
    }
  }

  _launchURL() async {
    const urlRegistration = 'https://account.pleinairclub.it/?page_id=23&c=1#panel-account';

    if (await canLaunch(urlRegistration)) {
      await launch(urlRegistration);
    } else {
      throw 'Could not launch $urlRegistration';
    }
  }

  static const textStyle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: kTextColor,
  );


  @override
  Widget build(BuildContext context) {
    final dynamic screenHeight = MediaQuery.of(context).size.height;
    final dynamic screenWidth = MediaQuery.of(context).size.width;

    //sl<LoginManager>().inRequest.add(input);

    //GetDevices
    // sl<HomeManager>().inRequest.add('43237786');

    //Get Featured
    //sl<HomeManager>().inFeaturedRequest.add(RequestCommand.START);

    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        backgroundColor: Colors.white,
        foregroundColor: Theme.of(context).primaryColor,
      ),
      SliverList(
          delegate: SliverChildListDelegate([
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Login to your account',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: kTextBlackColor2,
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                const Text(
                  'Enter your card number and password below.'
                  '\n(You need to registered on www.pleinairclub.it)',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: kTextColor,
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: kTextGreyColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: 'Ex. 4539498045289178',
                      ),
                      onSaved: (card) {
                        input.user = card;
                      },
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your card number';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: kTextGreyColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      obscureText: !_showPassword,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            _togglevisibility();
                          },
                          child: Icon(
                            _showPassword ? Icons.visibility : Icons.visibility_off,
                            color: kTextColor,
                          ),
                        ),
                        focusedBorder: InputBorder.none,
                        hintText: 'Password',
                      ),
                      onSaved: (password) {
                        input.pwd = password;
                      },
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                RichText(
                  key: _textKey,
                  text: TextSpan(
                    text: 'Password ',
                    style: textStyle,
                    children: <TextSpan>[
                      TextSpan(
                          text: ' forgot? ',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('The button is clicked!');
                              Navigator.pushNamed(
                                context,
                                PasswordScreen.id,
                              );
                            },
                          style: const TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w500,
                          )),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'By continue you agree to the ',
                      style: textStyle,
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Terms and conditions ',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('The button is clicked!');
                              },
                            style: const TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w500,
                            )),
                        const TextSpan(
                          text: 'of PleinAirClub',
                          style: textStyle,
                        ),
                      ],
                    ),
                  ),
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
                        _trySubmit();
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'BNon sei ancora registrato?  ',
                      style: textStyle,
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Registrati Ora',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('The button is clicked _launchURL!');
                                _launchURL();
                              },
                            style: const TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]))
    ]));
  }

  void loginConfirmation(BuildContext context) {
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
                          SizedBox(height: screenHeight * 0.25),
                          const Opacity(
                            opacity: 0.35,
                            child: CircleAvatar(
                                backgroundColor: greenColor,
                                radius: 57,
                                child: Icon(
                                  Icons.done,
                                  color: Colors.white,
                                  size: 50,
                                )),
                          ),
                          SizedBox(height: screenHeight * 0.04),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 50.0),
                            child: Text(
                              'Welcome',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: kTextBlackColor2,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 50.0),
                            child: Text(
                              'Thank you to filled out the registration.'
                              '\n Start now yo use the app!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: kTextColor,
                                fontSize: 14.5,
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.05),
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
                          SizedBox(height: screenHeight * 0.1),
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
}
