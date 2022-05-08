// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../Constants/TextStyleConstant.dart';

class GoogleLoginButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  const GoogleLoginButton({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: newOutlinedButton(),
    );
  }

  Widget newOutlinedButton() {
    return OutlinedButton(
      child: Opacity(
        opacity: 1,
        child: Row(
          children: [
            Image.asset('assets/google_icon.png', width: 30),
            const SizedBox(width: 25),
            Text(
              text,
              style: kGoogleLoginTextStyle,
            ),
          ],
        ),
      ),
      onPressed: onPressed,
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