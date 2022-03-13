import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/constants.dart';
import 'package:flutter_course/db_helper.dart';
import 'package:flutter_course/task_model.dart';

class NewTask extends StatefulWidget {
  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  bool isComplete = false;

  String taskName;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('New Task'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                  hintText: 'Add task',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
              onChanged: (value) {
                this.taskName = value;
              },
            ),
            Checkbox(
              value: isComplete,
              onChanged: (value) {
                this.isComplete = value;
                setState(() {});
              },
            ),
            RaisedButton(
              child: Text('Add New Task'),
              onPressed: () {
                Task task = Task(this.taskName, this.isComplete);
                DBHelper.dbHelper.insertTasks(task);
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
