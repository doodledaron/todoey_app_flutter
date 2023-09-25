import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/TaskData.dart';
import 'task_tile.dart';
import 'package:todoey/models/Task.dart';

class TasksList extends StatelessWidget {
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  //the acccess the state of Animated list
  void removeTask(int index, TaskData taskData) {
    final task = taskData.tasks[index];
    Future.delayed(Duration(milliseconds: 700), () {
      if (_key.currentState == null) {
        print('currentState is null');
      } else {
        _key.currentState!.removeItem(index, (context, animation) {
          return SizeTransition(
            sizeFactor: animation,
            child: TaskTile(
              text: task.name,
              isChecked: task.isDone,
              checkBoxCallBack: (checkboxState) {},
              onLongPressCallback: () {},
            ),
          );
        }, duration: Duration(milliseconds: 700));
        taskData.deleteTask(task);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //ListView
    //which builds the children on demand
    //This constructor is appropriate for list views with a large (or infinite) number of children
    // the builder is called only for those children that are actually visible.

    //Consumer widget simplifies the 'Provider.of<TaskData>(context)' into just 'taskData'
    //when taskData is updated it gonna rebuild
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return AnimatedList(
          itemBuilder: (context, index, animation) {
            final task = taskData.tasks[index];
            return SizeTransition(
              key: UniqueKey(),
              sizeFactor: animation,
              child: TaskTile(
                text: task.name,
                isChecked: task.isDone,
                checkBoxCallBack: (checkboxState) {
                  taskData.doneToggle(task);
                },
                onLongPressCallback: () {
                  removeTask(index, taskData);
                },
              ),
            );
          },
          initialItemCount: taskData.taskCount,
        );
      },
    );
  }
}

//it is dynamic, as long as the Task are added to the tasks, it only rebuilds the part where the user can actually see
// class TasksList extends StatelessWidget {
//   TasksList();
//
//   @override
//   Widget build(BuildContext context) {
//     //ListView
//     //which builds the children on demand
//     //This constructor is appropriate for list views with a large (or infinite) number of children
//     // the builder is called only for those children that are actually visible.
//
//     //Consumer widget simplifies the 'Provider.of<TaskData>(context)' into just 'taskData'
//     //when taskData is updated it gonna rebuild
//     return Consumer<TaskData>(
//       builder: (context, taskData, child) {
//         return ListView.builder(
//           itemBuilder: (context, index) {
//             final task = taskData.tasks[index];
//             return TaskTile(
//               text: task.name,
//               isChecked: task.isDone,
//               checkBoxCallBack: (checkboxState) {
//                 taskData.doneToggle(task);
//               },
//               onLongPressCallback: () {
//                 taskData.deleteTask(task);
//               },
//             );
//           },
//           //how many item to be shown, now the listView is dynamic
//           itemCount: taskData.taskCount,
//         );
//       },
//     );
//   }
// }
