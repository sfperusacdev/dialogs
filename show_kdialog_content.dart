import 'package:flutter/material.dart';
import 'package:tareo_app/kdialogs/show_kdialog.dart';

Future<T?> showKDialogContent<T>(
  BuildContext context, {
  double contentPadding = 24,
  TextButton? titleTextButton,
  String saveBtnText = "Save",
  void Function()? onSave,
  required Widget Function(BuildContext context) builder,
}) async {
  return await showKDialog(
    context,
    builder: (context) {
      return AlertDialog(
        titlePadding: EdgeInsets.zero,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              iconSize: 20,
              onPressed: () => Navigator.of(context).pop(null),
              icon: const Icon(Icons.close),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 1.0),
              child: Text(
                "Texto de la ventana",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Visibility(
                    visible: onSave != null,
                    child: TextButton(
                      onPressed: () => {if (onSave != null) onSave()},
                      style: Theme.of(context).textButtonTheme.style,
                      child: Text(saveBtnText),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        contentPadding: EdgeInsets.zero,
        content: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: contentPadding),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: contentPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [builder(context)],
            ),
          ),
        ),
      );
    },
  );
}
