import 'package:flutter/foundation.dart';
import 'task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy Eggs'),
    Task(name: 'Buy Bread'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(String newTaskName) {
    _tasks.add(Task(name: newTaskName));
    notifyListeners();
  }

  int get taskCount {
    return _tasks.length;
  }

  void toggleDone(int taskIndex) {
    _tasks[taskIndex].toggleDone();
    notifyListeners();
  }

  void removeTask(int taskIndex) {
    _tasks.removeAt(taskIndex);
    notifyListeners();
  }
}
