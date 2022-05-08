// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../Constants/ColorConstant.dart';
import 'TextFieldContainer.dart';

class RoundedPasswordField extends StatelessWidget {
  final String? hintText;
  final ValueChanged<String>? onChanged;
  const RoundedPasswordField({
    Key? key,
    this.hintText,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          icon: const Icon(
            Icons.lock,
            color: kBlack,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}