import 'package:flutter/material.dart';
import 'package:todo_app/src/Todo.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Todo(),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}
