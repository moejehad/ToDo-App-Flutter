import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/db_helper.dart';
import 'package:flutter_course/db_helper.dart';
import 'package:flutter_course/home.dart';
import 'package:flutter_course/task_model.dart';

class TaskWidget extends StatefulWidget {
  Task task;
  Function function;
  TaskWidget(this.task, [this.function]);

  @override
  _TaskWidgetState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  Task task = DBHelper.dbHelper
                      .selectSpecificTask(widget.task.taskName) as Task;
                  DBHelper.dbHelper.deleteTask(task);
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Home();
                    },
                  ));
                }),
            Text(widget.task.taskName),
            Checkbox(
              value: widget.task.isComplete,
              onChanged: (value) {
                this.widget.task.isComplete = !this.widget.task.isComplete;
                setState(() {});
                widget.function();
              },
            )
          ],
        ),
      ),
    );
  }
}
