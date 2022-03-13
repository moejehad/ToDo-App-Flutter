import 'package:flutter_course/db_helper.dart';

class Task {
  String taskName;
  bool isComplete;
  Task(this.taskName, this.isComplete);
  toJson() {
    return {
      DBHelper.taskNameColumnName: this.taskName,
      DBHelper.taskIsCompleteColumnName: this.isComplete ? 1 : 0
    };
  }
}
