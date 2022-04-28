// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../Buttons/OnboardingButtonWidget.dart';
import 'BottomNavigationController.dart';
import 'package:hive/hive.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final box = Hive.box('');

    return Scaffold(
      body: IntroductionScreen(
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
              onClicked: () {
                box.put('introduction', false);
                goToHomeScreen(context);
              },
            ),
            image: buildImage('assets/learn.png'),
            decoration: getPageDecoration(),
          ),
        ],
        onDone: () {
          box.put('introduction', false);
          goToHomeScreen(context);
        },
        showDoneButton: true,
        showSkipButton: true,
        skip: const Text('Geç'),
        next: const Icon(Icons.arrow_forward),
        onSkip: () {
          box.put('introduction', false);
          goToHomeScreen(context);
        },
        done: const Text('Ana Sayfa', style: TextStyle(fontWeight: FontWeight.w600)),
        dotsDecorator: getDotDecoration(),
      ),
    );
  }

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
