// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../Buttons/OnboardingButtonWidget.dart';
import 'BottomNavigationController.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'Title One',
              body: 'Body One',
              image: buildImage('assets/ebook.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Title Two',
              body: 'Body Two',
              image: buildImage('assets/readingbook.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Title Three',
              body: 'Body Three',
              image: buildImage('assets/manthumbs.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Title Four',
              body: 'Body Four',
              footer: OnboardingButtonWidget(
                text: 'Ana Sayfa',
                onClicked: () => goToHomeScreen(context),
              ),
              image: buildImage('assets/learn.png'),
              decoration: getPageDecoration(),
            ),
          ],
          done: const Text('Geç', style: TextStyle(fontWeight: FontWeight.w600)),
          onDone: () => goToHomeScreen(context),
          showDoneButton: false,
          showSkipButton: true,
          skip: const Text('Geç'),
          onSkip: () => goToHomeScreen(context),
          next: const Icon(Icons.arrow_forward),
          dotsDecorator: getDotDecoration(),
        ),
      );

  void goToHomeScreen(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const BottomNavigationController()),
      );

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  DotsDecorator getDotDecoration() => DotsDecorator(
        size: const Size.square(10.0),
        activeSize: const Size(10.0, 10.0),
        color: Colors.black26,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0)
        ),
      );

  PageDecoration getPageDecoration() => const PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 20),
        imagePadding: EdgeInsets.all(24),
        pageColor: Colors.white,
      );
}