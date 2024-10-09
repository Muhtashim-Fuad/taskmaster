import 'package:flutter/material.dart';

class ContextMenuDialog extends StatelessWidget {
  const ContextMenuDialog({super.key, required this.items, required this.title});

  final String title;
  final List<ContextMenuItem> items;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          for (int i = 0; i < items.length; i++)
            InkWell(
              onTap: items[i].onPressCallback,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Text(items[i].label),
              ),
            ),
          const SizedBox(height: 14.0),
        ],
      );
  }
}

class ContextMenuItem {
  final String label;
  final VoidCallback onPressCallback;

  ContextMenuItem({required this.label, required this.onPressCallback});
}
