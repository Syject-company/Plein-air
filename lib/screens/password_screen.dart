import 'package:flutter/material.dart';
import 'package:plein_air_club/helpers/constants.dart';
import 'package:plein_air_club/screens/main_screen.dart';

class PasswordScreen extends StatefulWidget {
  static const String id = '/password_screen';

  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  bool _showPassword = false;
  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }
  @override
  Widget build(BuildContext context) {
    final dynamic screenHeight = MediaQuery.of(context).size.height;
    final dynamic screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        backgroundColor: Colors.white,
        foregroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.04),
              const Text(
                'Password Forgetten?',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: kTextBlackColor2,
                ),
              ),
              SizedBox(height: screenHeight * 0.005),
              const Text(
                'Insert your ID Card and we’ll send an-email with '
                    '\nthe new password to the registered e-amil address.',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: kTextColor,
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
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: 'Ex. 4539498045289178',
                    ),
                    onSaved: (card) {

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
                    style: styleButton,
                    onPressed: () {
                      //_trySubmit();
                      loginConfirmation(context);
                    },
                    child: const Text(
                      'Send',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: screenHeight * 0.15),
                              const Text(
                                'Password Forgetten?',
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w700,
                                  color: kTextBlackColor2,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.005),
                              const Text(
                                'We just sent a new one to the address:',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: kTextColor,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.08),
                              const Center(
                                child: Text(
                                  'fb…….@li…..com',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    color: kTextColor,
                                  ),
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.075),
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
