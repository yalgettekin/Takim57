// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constants/StringConstant.dart';
import 'package:flutter_application_1/Constants/TextStyleConstant.dart';
import 'SignInScreen.dart';
import 'SignUpScreen.dart';

class LoginTabBarController extends StatelessWidget {
  const LoginTabBarController({Key? key}) : super(key: key);
  static const tabBarInitialIndex = 0;
  static const tabBarLength = 2;
  static const toolbarHeight = 0.0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: tabBarInitialIndex,
      length: tabBarLength,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: <Widget>[
              Text(kSignUpText, style: kTabTitleTextStyle),
              Text(kSignInText, style: kTabTitleTextStyle),
            ],
          ),
          toolbarHeight: toolbarHeight,
        ),
        body: const TabBarView(
          children: <Widget>[
            SignUpScreen(),
            SignInScreen(),
          ],
        ),
      ),
    );
  }
}
