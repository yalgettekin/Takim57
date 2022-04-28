import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/BottomNavigationController.dart';
import 'package:hive_flutter/hive_flutter.dart';
void main() async {
  await Hive.initFlutter();
  await Hive.openBox('');
  runApp(const SurveyApp());
}

class SurveyApp extends StatelessWidget {
  const SurveyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigationController(),
    );
  }
}