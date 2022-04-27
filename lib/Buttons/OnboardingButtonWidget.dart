// ignore_for_file: file_names

import 'package:flutter/material.dart';

class OnboardingButtonWidget extends StatelessWidget {
  final String? text;
  final VoidCallback? onClicked;

  const OnboardingButtonWidget({
    Key? key,
    @required this.text,
    @required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => RaisedButton(
        onPressed: onClicked,
        color: Theme.of(context).primaryColor,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Text(
          text!,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      );
}