import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final color;
  final textcolor;
  final String textButton;
  final buttonTapped;
  Buttons({this.color, this.textcolor, required this.textButton,this.buttonTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                textButton,
                style: TextStyle(color: textcolor, fontSize: 25),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
