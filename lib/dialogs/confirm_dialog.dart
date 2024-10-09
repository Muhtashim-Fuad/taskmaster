import 'package:flutter/material.dart';

Future<bool> showConfirmationDialog(BuildContext context, {required String title, required String message}) async {
  return await showModalBottomSheet<bool>(
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            Text(
              message,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 14.0,
                height: 1.25,
              ),
            ),
            const SizedBox(height: 18.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(true); // Return true when "Confirm" is clicked
                    },
                    child: const Text("Confirm"), // Custom "Yes" button text
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(false); // Return false when "Cancel" is clicked
                    },
                    child: const Text("Cancel"), // Custom "No" button text
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  ) ?? false; // Return false if dialog is dismissed
}
