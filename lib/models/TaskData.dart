import 'package:flutter/foundation.dart';
import 'Task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task('Buy milk'),
    Task('watch hentai'),
    Task('watch hentai'),
  ];

  //The tasks return is not modifiable
  //unmodifiable view of a list (not listview)
  //the prevent we modify the task through the getter
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(String text) {
    final task = Task(text);
    _tasks.add(task);
    notifyListeners();
  }

  int get taskCount {
    return _tasks.length;
  }

  void doneToggle(Task task) {
    task.doneToggle();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
