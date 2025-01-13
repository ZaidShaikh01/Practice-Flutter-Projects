import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF854F6c),
      content: Container(
        height: 120,
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter your task",
              ),
            ),
            //save button

            //cancel button

            Row(
              children: [
                
              ],
            )
          ],
        ),
      ),
    );
  }
}
