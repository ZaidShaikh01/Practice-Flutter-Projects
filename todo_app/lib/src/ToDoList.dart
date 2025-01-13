import 'package:flutter/material.dart';

class ToDoList extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;

  ToDoList(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Container(
        // ignore: prefer_const_constructors
        padding: EdgeInsets.all(24),
        // ignore: prefer_const_constructors, sort_child_properties_last
        child: Row(
          children: [
            Checkbox(
              value: taskCompleted,
              onChanged: onChanged,
              activeColor: const Color(0xFF190019),
            ),

            //task name
            Text(
              taskName,
              style: TextStyle(
                  fontSize: 24,
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFDFB6B2),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
