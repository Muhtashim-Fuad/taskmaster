import 'package:flutter/material.dart';
import 'package:task_master/widgets/about_body.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About"),),
      body: AboutPageBody(),
    );
  }
}
