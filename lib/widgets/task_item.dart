import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_master/models/task.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.onRemoved});

  final VoidCallback onRemoved;
  static const Color inactiveColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, task, child) => Card(
        //surfaceTintColor: const Color.fromARGB(255, 209, 209, 209),
        surfaceTintColor: Colors.white,
        color: Theme.of(context).colorScheme.onInverseSurface,
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
          side: const BorderSide(
            width: 0.1,
            color: Color.fromARGB(255, 104, 104, 104),
          ),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Checkbox(
              value: task.isChecked(),
              onChanged: (value) => task.setIsChecked(value!),
            ),
            Expanded(
              child: Text(
                task.label,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: task.isChecked() ? inactiveColor : Theme.of(context).colorScheme.onPrimaryContainer,
                  decorationColor: task.isChecked() ? inactiveColor : Theme.of(context).colorScheme.onPrimaryContainer,
                  decoration: task.isChecked()
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  letterSpacing: 0,
                ),
              ),
            ),
            IconButton(
              onPressed: () => onRemoved(),
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
