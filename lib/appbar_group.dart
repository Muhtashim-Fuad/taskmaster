import 'package:flutter/material.dart';

class AppBarGroup {
  static AppBar homeAppBar = AppBar(
    title: const Padding(
      padding: EdgeInsets.only(left: 6.0),
      child: Text(
        'Task Master',
        style: TextStyle(
          fontFamily: "Montserrat",
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
  static AppBar taskAppBar(String title) {
    return AppBar(
      leading: const BackButton(),
      title: Text(title),
    );
  }
}

class Floater {
  static FloatingActionButton addButton(VoidCallback onTap) => FloatingActionButton
  (
    onPressed: onTap,
    child: const Icon(Icons.add),
  );
}
