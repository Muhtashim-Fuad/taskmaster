import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_master/dialogs/confirm_dialog.dart';
import 'package:task_master/dialogs/input_dialog.dart';
import 'package:task_master/models/card.dart';
import 'package:task_master/models/project.dart';
import 'package:task_master/widgets/extended_floating_button.dart';
import 'package:task_master/widgets/task_card.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Project>(
      builder: (context, project, child) => Scaffold(
        appBar: AppBar(title: Text(project.title)),
        floatingActionButton: ExtendedFloatingButton(
          onPressed: () async {
            String? title = await showInputDialog(
              context,
              inputLabel: "Enter Project Card",
              buttonLabel: "Add New Card",
            );

            project.addCard(title!);
          },
        ),
        body: ReorderableListView.builder(
          physics: const BouncingScrollPhysics(),
          onReorder: (oldIndex, newIndex) =>
              project.reorder(oldIndex, newIndex),
          itemCount: project.cards.length,
          itemBuilder: (context, index) =>
              ChangeNotifierProvider<CardData>.value(
            key: ValueKey(index),
            value: project.cards[index],
            child: TaskCard(
              onRemoved: () async {
                Navigator.pop(context);
                bool isConfirmed = await showConfirmationDialog(
                  context,
                  title: "Remove Card?",
                  message: "Are you sure you want to delete this card? This action cannot be undone!",
                );

                if (isConfirmed) project.removeCard(project.cards[index]);
              },
              onCleared: () async {
                Navigator.pop(context);
                bool isConfirmed = await showConfirmationDialog(
                  context,
                  title: "Clear Card?",
                  message: "Are you sure you want to delete all tasks from this card? This action cannot be undone!",
                );

                if (isConfirmed) project.cards[index].clear();
              },
            ),
          ),
        ),
      ),
    );
  }
}
