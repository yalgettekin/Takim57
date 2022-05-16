// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../Constants/TextStyleConstant.dart';
import '../../Constants/StringConstant.dart';
import '../../Components/Login/RoundedInputField.dart';
import '../../Components/Login/RoundedPasswordField.dart';
import '../../Components/Login/RoundedButton.dart';
import '../BottomNavigationController.dart';
import '../../Components/Login/GoogleLoginButton.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String? _email, _password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: size.height * 0.01),
          Image.asset('assets/logo.png', height: size.height * 0.20),
          SizedBox(height: size.height * 0.01),
          RoundedInputField(
            hintText: kEmailText,
            onChanged: (value) {
              setState(() {
                _email = value.trim();
              });
            },
          ),
          SizedBox(height: size.height * 0.01),
          RoundedPasswordField(
            hintText: kPasswordText,
            onChanged: (value) {
              setState(() {
                _password = value.trim();
              });
            },
          ),
          SizedBox(height: size.height * 0.01),
          RoundedButton(
            text: kSignInText,
            onPressed: () {
              if (_email != null && _password != null) {
                auth.signInWithEmailAndPassword(
                    email: _email!, password: _password!);
              }
            },
          ),
          SizedBox(height: size.height * 0.01),
          const GoogleLoginButton(text: kSignInWithGoogleText),
          TextButton(
              onPressed: () {
                goToHomeScreen(context);
              },
              child: const Text(kContinueWithoutSignInText,
                  style: kContinueWithoutLoginTextStyle)),
        ],
      ),
    );
  }
}

void goToHomeScreen(context) => Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_) => const BottomNavigationController()));
