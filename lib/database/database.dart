import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];

  final _myToDoBox = Hive.box("todo_box");

  // first time opening this app
  void createInitialData() {
    toDoList = [
      ["Lucas First Flutter", true],
      ["Next project", false]
    ];
  }

  // load data from database
  void loadData() {
    toDoList = _myToDoBox.get("TODOLIST");
  }

  void updateDataBase() {
    _myToDoBox.put("TODOLIST", toDoList);
  }
}
