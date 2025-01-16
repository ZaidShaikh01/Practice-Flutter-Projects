import 'package:flutter/material.dart';
import 'package:todo_app/src/my_button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController myController;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.myController,
    required this.onCancel,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF854F6c),
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: myController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter your task",
              ),
            ),
            //save button

            //cancel button

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //! This is save button
                MyButton(text: "Save", onPressed: onSave),
                const SizedBox(
                  width: 12,
                ),
                MyButton(text: "Cancel", onPressed: onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
