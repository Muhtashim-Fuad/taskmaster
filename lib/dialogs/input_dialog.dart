import 'package:flutter/material.dart';

Future<String?> showInputDialog(
    BuildContext context,
    {
      required String inputLabel,
      required String buttonLabel,
    }
  ) async {

  final TextEditingController controller = TextEditingController();

  return await showModalBottomSheet<String>(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                inputLabel,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      letterSpacing: 0,
                    ),
              ),
              const SizedBox(height: 18.0),
              TextField(
                style: Theme.of(context).textTheme.bodyMedium,
                controller: controller,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: inputLabel,
                ),
              ),
              const SizedBox(height: 12.0),
              ElevatedButton(
                onPressed: () {
                   if(controller.text.trim() != "") Navigator.of(context).pop(controller.text);
                },
                child: Text(buttonLabel),
              ),
            ],
          ),
        ),
      );
    },
  );
}
