// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../Constants/TextStyleConstant.dart';
import '../../Constants/StringConstant.dart';
import '../../Components/Login/RoundedInputField.dart';
import '../../Components/Login/RoundedButton.dart';
import '../../Components/Login/RoundedPasswordField.dart';
import '../BottomNavigationController.dart';
import '../../Components/Login/GoogleLoginButton.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? _email, _password, _passwordAgain;
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
          RoundedPasswordField(
            hintText: kPasswordAgainText,
            onChanged: (value) {
              setState(() {
                _passwordAgain = value.trim();
              });
            },
          ),
          SizedBox(height: size.height * 0.01),
          RoundedButton(
            text: kSignUpText,
            onPressed: () {
              if (_email != null && _password != null) {
                if (_password == _passwordAgain) {
                  auth.createUserWithEmailAndPassword(
                      email: _email!, password: _password!);
                }
              }
            },
          ),
          SizedBox(height: size.height * 0.01),
          const GoogleLoginButton(text: kSignUpWithGoogleText),
          TextButton(
              onPressed: () {
                goToHomeScreen(context);
              },
              child: const Text(kContinueWithoutSignUpText,
                  style: kContinueWithoutLoginTextStyle)),
        ],
      ),
    );
  }
}

void goToHomeScreen(context) => Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_) => const BottomNavigationController()));
