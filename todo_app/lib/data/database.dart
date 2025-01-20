import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDo = [];
  //Reference the box
  var _box = Hive.box("myBox");

  ///First time opening the app ever

  void createInitialData() {
    toDo = [
      ["You Can delete this", false],
      ["Just Slide the text to left side.", false],
    ];
  }

  ///Load the data
  void LoadData() {
    toDo = _box.get("TODOLIST");
  }

  ///Update the database
  void updateDataBase() {
    _box.put("TODOLIST", toDo);
  }
}
