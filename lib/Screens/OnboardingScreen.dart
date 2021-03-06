// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../Constants/StringConstant.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'BottomNavigationController.dart';
import 'package:hive/hive.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final box = Hive.box('');
    final double screenFullWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: kOnboardingTitleOne,
              body: kOnboardingBodyOne,
              image: Image.asset('assets/onboarding_screen_image1.png', width: screenFullWidth),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: kOnboardingTitleTwo,
              body: kOnboardingBodyTwo,
              image: Image.asset('assets/onboarding_screen_image2.png', width: screenFullWidth),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: kOnboardingTitleThree,
              body: kOnboardingBodyThree,
              image: Image.asset('assets/onboarding_screen_image3.png', width: screenFullWidth),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: kOnboardingTitleFour,
              body: kOnboardingBodyFour,
              image: Image.asset('assets/onboarding_screen_image4.png', width: screenFullWidth),
              decoration: getPageDecoration(),
            ),
          ],
          onDone: () {
            box.put('introduction', false);
            goToHomeScreen(context);
          },
          showDoneButton: true,
          showSkipButton: true,
          skip: const Text(kOnboardingSkipText),
          next: const Icon(Icons.arrow_forward),
          onSkip: () {
            box.put('introduction', false);
            goToHomeScreen(context);
          },
          done: const Text(kOnboardingHomeScreenText, style: TextStyle(fontWeight: FontWeight.w600)),
          dotsDecorator: getDotDecoration(),
        ),
      ),
    );
  }

  void goToHomeScreen(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const BottomNavigationController()),
      );

  DotsDecorator getDotDecoration() => DotsDecorator(
        size: const Size.square(10.0),
        activeSize: const Size(10.0, 10.0),
        color: Colors.black26,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      );

  PageDecoration getPageDecoration() => const PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 20),
        imagePadding: EdgeInsets.all(24),
        pageColor: Colors.white,
      );
}
