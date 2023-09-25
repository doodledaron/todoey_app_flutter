import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/TaskData.dart';

import '../models/Task.dart';

class TaskTile extends StatefulWidget {
  final String text;
  final bool isChecked;
  final Function(bool?) checkBoxCallBack;
  final Function() onLongPressCallback;

  TaskTile({
    required this.text,
    required this.isChecked,
    required this.checkBoxCallBack,
    required this.onLongPressCallback,
  });

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  // void checkBoxCallBack(bool? checkBoxState) {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: widget.onLongPressCallback,
      child: CheckboxListTile(
          title: Text(
            widget.text,
            style: TextStyle(
                color: Colors.black,
                decoration:
                    widget.isChecked ? TextDecoration.lineThrough : null),
          ),
          value: widget.isChecked,
          onChanged: widget.checkBoxCallBack),
    );
  }
}
