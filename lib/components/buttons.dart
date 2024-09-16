// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

enum ButtonType { defaultType, danger }

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonType buttonType; // Added buttonType property

  MyButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.buttonType = ButtonType.defaultType, // Default value
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;

    // Determine colors based on buttonType
    switch (buttonType) {
      case ButtonType.danger:
        backgroundColor = Colors.red;
      case ButtonType.defaultType:
      default:
        backgroundColor = Colors.blue[900]!;
        break;
    }

    return MaterialButton(
      onPressed: onPressed,
      color: backgroundColor,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4), // Adjust this value
      ),
      child: Text(text),
    );
  }
}
