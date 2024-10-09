import 'package:flutter/material.dart';

class TaskData extends ChangeNotifier {
  final String label;
  bool _isChecked = false;

  TaskData({required this.label});

  bool isChecked() => _isChecked;
  void setIsChecked(bool value) {
    _isChecked = value;
    notifyListeners();
  }
}
