import 'package:flutter/material.dart';

class CustomDialogBox extends StatelessWidget {
  const CustomDialogBox(
      {Key? key,
      required this.text,
      this.firstButton,
      this.secondButton,
      required this.areButtonsFunctional})
      : super(key: key);

  final Widget text;
  final Widget? firstButton;
  final Widget? secondButton;
  final bool areButtonsFunctional;

  @override
  Widget build(BuildContext context) {
    if (areButtonsFunctional == true) {
      return AlertDialog(
        title: text,
        actions: [
          firstButton!,
          secondButton!,
        ],
      );
    } else {
      return AlertDialog(
        title: text,
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Close"),
          ),
        ],
      );
    }
  }
}
