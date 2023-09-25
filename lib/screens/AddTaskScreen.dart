import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/widgets/tasks_list.dart';
import 'package:todoey/models/TaskData.dart';

import '../models/Task.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen();

  @override
  Widget build(BuildContext context) {
    String taskText = '';

    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  'Add Task',
                  style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontWeight: FontWeight.w400,
                      fontSize: 30),
                ),
              ),
              TextField(
                onChanged: (value) {
                  taskText = value;
                },
                autofocus: true,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.black26),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 4.0),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 4.0),
                  ),
                  hintText: 'Type in your task',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  if (taskText.isNotEmpty) {
                    Provider.of<TaskData>(context, listen: false)
                        .addTask(taskText);
                  }
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Add',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent),
              )
            ],
          ),
        ),
      ),
    );
  }
}
