import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_master/models/database.dart';
import 'package:task_master/screens/home_page.dart';
import 'package:task_master/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Database>(
      create: (BuildContext context) => Database(),
      child: MaterialApp(
        theme: masterTheme,
        home: const HomePage(),
      ),
    );
  }
}
