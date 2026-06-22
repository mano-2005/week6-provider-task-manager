import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => List.unmodifiable(_tasks);
  int get taskCount => _tasks.length;

  void addTask(String title) {
    if (title.trim().isEmpty) return;
    _tasks.add(Task(id: DateTime.now().toString(), title: title));
    notifyListeners();
  }

  void toggleTaskStatus(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}