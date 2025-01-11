import 'package:flutter/material.dart';
import 'package:stateful_vs_stateless/src/counterPage.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Counterpage(),
      

    );
  }
}