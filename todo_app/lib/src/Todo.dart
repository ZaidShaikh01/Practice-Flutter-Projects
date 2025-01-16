import 'package:flutter/material.dart';
import 'package:todo_app/src/ToDoList.dart';
import 'package:todo_app/src/dialog_box.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  final _controller = TextEditingController();
  List toDo = [
    ["make tut", false],
    ["tut", false],
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDo[index][1] = !toDo[index][1];
    });
  }

  // save new task
  void saveTheTask() {
    setState(() {
      toDo.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          myController: _controller,
          onSave: saveTheTask,
          onCancel: Navigator.of(context).pop,
        );
      },
    );
  }

  //! Delete Button
  void deleteTask(int index) {
    setState(() {
      toDo.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBE4D8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF854F6C),
        title: Center(
          child: Text("TO DO"),
        ),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
        hoverColor: const Color(0xFF522b58),
        hoverElevation: 10,
        backgroundColor: const Color(0xFF854F6c),
      ),
      body: ListView.builder(
        itemCount: toDo.length,
        itemBuilder: (context, index) {
          return ToDoList(
            taskName: toDo[index][0],
            taskCompleted: toDo[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteTodo: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
