import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_master/dialogs/confirm_dialog.dart';
import 'package:task_master/dialogs/context_dialog.dart';
import 'package:task_master/dialogs/input_dialog.dart';
import 'package:task_master/models/card.dart';
import 'package:task_master/models/task.dart';
import 'package:task_master/widgets/task_item.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.onRemoved, required this.onCleared});

  final VoidCallback onRemoved;
  final VoidCallback onCleared;

  void onContextMenu(BuildContext context) {
    List<ContextMenuItem> items = [
      ContextMenuItem(
        label: "Remove Card",
        onPressCallback: onRemoved,
      ),
      ContextMenuItem(
        label: "Clear Card",
        onPressCallback: onCleared,
      ),
    ];
    showModalBottomSheet(
      context: context,
      builder: (context) =>
          ContextMenuDialog(title: 'Project Options', items: items),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CardData>(
      builder: (context, card, child) => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: const BorderSide(
            width: 0.1,
            color: Colors.grey,
          ),
        ),
        margin: const EdgeInsets.all(8.0),
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      card.title,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontVariations: [FontVariation("wght", 800)],
                      ),
                    ),
                    IconButton(
                      onPressed: () => onContextMenu(context),
                      icon: const Icon(Icons.more_horiz),
                    ),
                  ],
                ),
              ),
              for (int i = 0; i < card.tasks.length; i++)
                ChangeNotifierProvider<TaskData>.value(
                  value: card.tasks[i],
                  child: TaskItem(
                    onRemoved: () async {
                      bool isConfirmed = await showConfirmationDialog(
                        context,
                        title: "Delete Task?",
                        message:
                            "Are you sure you want to delete this task? This action cannot be undone.",
                      );

                      // ignore: use_build_context_synchronously
                      if (isConfirmed) card.removeTask(card.tasks[i]);
                    },
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ElevatedButton(
                  onPressed: () async {
                    String? title = await showInputDialog(
                      context,
                      inputLabel: "Enter Task Title",
                      buttonLabel: "Add New Task",
                    );

                    card.addTask(title!);
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add, size: 18.0),
                      SizedBox(width: 4.0),
                      Text("Add New Task"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
