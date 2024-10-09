import 'package:flutter/material.dart';
import 'package:task_master/models/task.dart';

class CardData extends ChangeNotifier {
  final String title;
  final List<TaskData> tasks;

  CardData({required this.tasks, required this.title});

  void clear() {
    tasks.clear();
    notifyListeners();
  }

  void addTask(String label) {
    TaskData task = TaskData(label: label);
    tasks.add(task);
    notifyListeners();
  }

  void removeTask(TaskData task) {
    tasks.remove(task);
    notifyListeners();
  }
}
