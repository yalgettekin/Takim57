// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../Constants/TextStyleConstant.dart';
import '../../Constants/StringConstant.dart';
import '../../Components/Login/RoundedInputField.dart';
import '../../Components/Login/RoundedPasswordField.dart';
import '../../Components/Login/RoundedButton.dart';
import '../BottomNavigationController.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.03),
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
            RoundedButton(
              text: kSignInText,
              onPressed: () {},
            ),
            // GoogleLoginButton(
            //       iconSrc: "assets/icons/facebook.svg",
            //       press: () {},
            // ),
            TextButton(
              onPressed: () {
                goToHomeScreen(context);
              },
              child: const Text(
                kContinueWithoutSignInText,
                style: kContinueWithoutLoginTextStyle)
          ),
          ],
        ),
    );
  }
}

void goToHomeScreen(context) => Navigator.of(context).pushReplacement(
         MaterialPageRoute(builder: (_) => const BottomNavigationController())
       );