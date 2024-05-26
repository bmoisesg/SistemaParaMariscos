import 'package:flutter/material.dart';

class CustomDialog {
  static showMsg({
    required BuildContext context,
    required String title,
    required String detail,
    required Function fnt,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          title: Text(title),
          actions: [
            TextButton(
              onPressed: () => fnt(),
              child: const Text('OK'),
            ),
          ],
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(),
              const SizedBox(height: 30),
              Text(detail),
            ],
          ),
        );
      },
    );
  }

  static showComponents({
    required BuildContext context,
    required Widget components,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          content: components,
        );
      },
    );
  }
}
