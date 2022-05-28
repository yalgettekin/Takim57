// ignore_for_file: file_names

import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Screens/Login/LoginTabBarController.dart';
import '../Constants/StringConstant.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  GoogleSignIn _googleSignIn = GoogleSignIn();
  String signinText = "";

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Container(
          child: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                signinText = kExitText;
              } else {
                signinText = kSignUpText;
              }
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: const Color(0xffc4c4c4),
                  title: Text(
                    'Profil',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: "SourceSansPro",
                        fontStyle: FontStyle.normal,
                        fontSize: 32.0),
                  ),
                  centerTitle: true,
                ),
                body: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: snapshot.hasData
                              ? CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    snapshot.data!.photoURL.toString(),
                                  ),
                                )
                              : const Icon(CupertinoIcons.profile_circled,
                                  size: 55),
                        ),
                        Text(snapshot.data?.displayName ?? kUnknown,
                            style: const TextStyle(
                                color: const Color(0xff000000),
                                fontWeight: FontWeight.w400,
                                fontFamily: "SourceSansPro",
                                fontStyle: FontStyle.normal,
                                fontSize: 24.0),
                            textAlign: TextAlign.left),
                        Padding(
                          padding: const EdgeInsets.only(left: 80),
                          child: Image.asset(
                              'assets/score.png'),
                        ),
                        // 3000
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text("3000",
                              style: const TextStyle(
                                  color: const Color(0xff000000),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "SourceSansPro",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 32.0),
                              textAlign: TextAlign.left),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 135),
                      child: GestureDetector(
                        onTap: () async {
                          if (snapshot.hasData) {
                            _googleSignIn.signOut();
                            FirebaseAuth.instance.signOut();
                          } else {
                            goToLoginScreen(context);
                          }
                        },
                        child: Container(
                            child: Align(
                              child: Text(signinText,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    color: Color(0xff000000),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  )),
                            ),
                            width: 135,
                            height: 33,
                            decoration: new BoxDecoration(
                              color: Color(0xffffeeee),
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0x3f000000),
                                    offset: Offset(0, 4),
                                    blurRadius: 5,
                                    spreadRadius: 0)
                              ],
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 38.0, left: 38, top: 38, bottom: 12),
                      child: Container(
                          child: Align(
                              child: new Text("Lider Tablosu",
                                  style: TextStyle(
                                    fontFamily: 'Yomogi',
                                    color: Color(0xff000000),
                                    fontSize: 28,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  ))),
                          width: 286,
                          height: 48,
                          decoration: new BoxDecoration(
                            color: Color(0xfffe5b5f),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0x3f000000),
                                  offset: Offset(0, 4),
                                  blurRadius: 5,
                                  spreadRadius: 0)
                            ],
                          )),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Card(
                            margin: EdgeInsets.only(
                                right: 10, left: 10, bottom: 10),
                            child: ListTile(
                              title: Text(
                                '${index + 1}.Kullanıcı',
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro', fontSize: 25),
                              ),
                              tileColor: Color(0xffc4c4c4),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      );
}

void goToLoginScreen(context) => Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_) => const LoginTabBarController()));
