// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/OnboardingScreen.dart';
import 'ProfileTab.dart';
import 'BoardTab.dart';
import 'LeaderboardTab.dart';
import 'package:hive/hive.dart';

class BottomNavigationController extends StatefulWidget {
  const BottomNavigationController({Key? key}) : super(key: key);

  @override
  State<BottomNavigationController> createState() =>
      _BottomNavigationControllerState();
}

class _BottomNavigationControllerState
    extends State<BottomNavigationController> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    BoardTab(),
    LeaderboardTab(),
    ProfileTab()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final box = Hive.box('');
    bool firstTimeState = box.get('introduction') ?? true;

    return firstTimeState
        ? const OnboardingScreen()
        : Scaffold(
            body: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Pano',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.leaderboard),
                  label: 'Skorbord',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.people),
                  label: 'Profil',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.blue,
              onTap: _onItemTapped,
            ),
          );
  }
}
