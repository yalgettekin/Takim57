// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/BoardTab.dart';
import '../../Constants/TextStyleConstant.dart';
import '../../Constants/StringConstant.dart';
import '../../Components/Login/RoundedInputField.dart';
import '../../Components/Login/RoundedButton.dart';
import '../../Components/Login/RoundedPasswordField.dart';
import '../BottomNavigationController.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RoundedInputField(
            hintText: kUsernameText,
            onChanged: (value) {},
          ),
          SizedBox(height: size.height * 0.01),
          RoundedPasswordField(
            hintText: kPasswordText,
            onChanged: (value) {},
          ),
          SizedBox(height: size.height * 0.01),
          RoundedPasswordField(
            hintText: kPasswordAgainText,
            onChanged: (value) {},
          ),
          SizedBox(height: size.height * 0.01),
          RoundedButton(
            text: kSignUpText,
            onPressed: () {},
          ),
          SizedBox(height: size.height * 0.01),
          // GoogleLoginButton(
          //       iconSrc: "assets/icons/facebook.svg",
          //       press: () {},
          // ),
          TextButton(
              onPressed: () {
                goToHomeScreen(context);
              },
              child: const Text(
                kContinueWithoutSignUpText,
                style: kContinueWithoutLoginTextStyle)
          ),
        ],
      ),
    );
  }
}

void goToHomeScreen(context) => Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_) => const BottomNavigationController()));
