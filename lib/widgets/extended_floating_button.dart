import 'package:flutter/material.dart';

class ExtendedFloatingButton extends StatelessWidget {
  const ExtendedFloatingButton({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: const Icon(Icons.add),
    );
  }
}
