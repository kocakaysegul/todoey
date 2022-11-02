import 'package:flutter/material.dart';
import 'package:todoey/widgets/task_tile.dart';
import 'package:todoey/models/task.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

class TasksList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData> (
      builder: (context, taskData, child) {
        return ListView.builder(itemBuilder: (contex, index) {
          final task = taskData.tasks[index];
          return TaskTile(
            isChecked: task.isDone,
            taskTitle: task.name,
            checkboxCallback: (checkboxState){
              /*
            setState(() {
              Provider.of<TaskData>(context).tasks[index].toggleDone();
            });
             */
              taskData.updateTask(task);
            }, longPressCallback: () {
              taskData.deleteTask(task);
          },
          );
        },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
