// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Counterpage extends StatefulWidget {
  const Counterpage({super.key});

  @override
  State<Counterpage> createState() => _CounterpageState();
}

class _CounterpageState extends State<Counterpage> {
  int _counter = 0;

  void incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
        leading: Icon(Icons.favorite),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("This many time you have clicked on counter"),
            Text(
              _counter.toString(),
              style: TextStyle(
                backgroundColor: Colors.deepPurple,
                fontSize: 23,
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(),
              onPressed: incrementCounter,
              child: Text(
                "Increment!",
                style: TextStyle(
                  fontSize: 23,
                  backgroundColor: Colors.amber,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
