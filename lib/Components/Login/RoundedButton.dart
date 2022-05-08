// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../Constants/ColorConstant.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color color, textColor;
  const RoundedButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.color = kDeepGreen,
    this.textColor = kWhite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: newElevatedButton(),
      ),
    );
  }

  Widget newElevatedButton() {
    return ElevatedButton(
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          primary: color,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          textStyle: TextStyle(
              color: textColor, fontSize: 20, fontWeight: FontWeight.w600)),
    );
  }
}