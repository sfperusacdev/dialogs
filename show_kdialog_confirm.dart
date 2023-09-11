import 'package:flutter/material.dart';
import 'package:tareo_app/kdialogs/show_kdialog_content.dart';

Future<bool?> showKDialogConfirm(
  BuildContext context, {
  String title = "Confirm",
  required String message,
  String acceptText = "ACCEPT",
  String cancelText = "CANCEL",
}) async {
  return await showKDialogContent<bool>(
    context,
    scrollPadding: const EdgeInsets.only(bottom: 4.0),
    title: title,
    closeOnOutsideTab: false,
    builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(message),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(cancelText, style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(acceptText, style: const TextStyle(fontWeight: FontWeight.bold)),
              )
            ],
          )
        ],
      );
    },
  );
}
