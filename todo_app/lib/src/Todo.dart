import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/src/ToDoList.dart';
import 'package:todo_app/src/dialog_box.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  // Reference the box
  var _box = Hive.box("myBox");

  final _controller = TextEditingController();
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    //If this is the first time opening then create some data
    if (_box.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.LoadData();
    }
    super.initState();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDo[index][1] = !db.toDo[index][1];
    });
    db.updateDataBase();
  }

  // save new task
  void saveTheTask() {
    setState(() {
      db.toDo.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
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
      db.toDo.removeAt(index);
    });
    db.updateDataBase();
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
        itemCount: db.toDo.length,
        itemBuilder: (context, index) {
          return ToDoList(
            taskName: db.toDo[index][0],
            taskCompleted: db.toDo[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteTodo: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
