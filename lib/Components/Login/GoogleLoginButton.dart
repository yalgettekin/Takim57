// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../Constants/StringConstant.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../Constants/TextStyleConstant.dart';
import '../../Screens/Login/LoginTabBarController.dart';

class GoogleLoginButton extends StatefulWidget {
  final String text;
  const GoogleLoginButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<GoogleLoginButton> createState() => _GoogleLoginButtonState();
}

class _GoogleLoginButtonState extends State<GoogleLoginButton> {
  GoogleSignIn _googleSignIn = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(kWelcomeText, style: kSignInWelcomeTextStyle),
                const SizedBox(height: 10),
                CircleAvatar(
                  backgroundImage:
                      NetworkImage(snapshot.data!.photoURL.toString()),
                ),
                const SizedBox(height: 10),
                Text(snapshot.data!.displayName.toString(), style: kSignInWelcomeTextStyle,),
              ],
            ));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          return newOutlinedButton();
        },
      ),
    );
  }

  Widget newOutlinedButton() {
    return OutlinedButton(
      child: Row(
        children: [
          Image.asset('assets/google_icon.png', width: 30),
          const SizedBox(width: 25),
          Text(
            widget.text,
            style: kGoogleLoginTextStyle,
          ),
        ],
      ),
      onPressed: () async {
        final newUser = await _googleSignIn.signIn();
        final googleAuth = await newUser!.authentication;
        final credentials = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
        await FirebaseAuth.instance.signInWithCredential(credentials);
      },
      style: OutlinedButton.styleFrom(
          side: const BorderSide(width: 3.0),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          textStyle: kGoogleLoginTextStyle),
    );
  }
}

void goToHomeScreen(context) => Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_) => const LoginTabBarController()));
