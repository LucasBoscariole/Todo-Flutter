import 'package:flutter/material.dart';
import 'package:todo_flutter/components/dialog_box.dart';
import 'package:todo_flutter/components/todo_tile.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // text controller
  final _controller = TextEditingController();

  // list of todo
  List toDoList = [
    ["Test 1", false],
    ["Test 2", false],
  ];

  // checkbox changed
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
    });
    _controller.clear();
    Navigator.of(context).pop();
  }

  void cancelCreation() {
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: cancelCreation,
          );
        }).then((value) {
      _controller.clear();
    });
  }

  void deleteTask(int index) {
    Fluttertoast.showToast(
      msg: "'${toDoList[index][0]}' deleted!",
      toastLength: Toast.LENGTH_LONG, 
      gravity: ToastGravity.BOTTOM, 
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.blue[900],
      textColor: Colors.white,
      fontSize: 16.0,
    );
     setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("TO DO"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add)),
      body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: toDoList[index][0],
              taskCompleted: toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteTodo: (context) => deleteTask(index),
            );
          }),
    );
  }
}
