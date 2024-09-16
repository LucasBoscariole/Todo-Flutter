// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:todo_flutter/components/buttons.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return AlertDialog(
      backgroundColor: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Adjust this value
      ),
      content: Container(
        width: screenWidth,
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // user input
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add a new task"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                  text: 'Save',
                  onPressed: onSave,
                ),
                const SizedBox(
                  width: 10,
                ),
                MyButton(
                  text: 'Cancel',
                  onPressed: onCancel,
                  buttonType: ButtonType.danger,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
