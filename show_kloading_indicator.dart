import 'package:flutter/material.dart';

/// returns a function with which we can finish the loading process.
Future<void Function()> showKLoadingIndicatorWithMessage(
  BuildContext context, {
  String message = "Loading Please Wait...",
  TextStyle? textStyle,
}) async {
  textStyle ??= const TextStyle(color: Colors.black38, fontSize: 14, height: 1.2);
  void Function()? clouser;
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      clouser = () {
        if (context.mounted) Navigator.of(context).pop(null);
      };
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          content: SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(width: 22.0),
                Expanded(
                  child: Text(
                    message,
                    style: textStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
  while (clouser == null) {
    // wait until the closure variable becomes non-null.
    await Future.delayed(const Duration(milliseconds: 1));
  }
  return clouser ?? () => {};
}

Future<void Function()> showKLoadingIndicator(BuildContext context) async {
  void Function()? clouser;
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      clouser = () {
        if (context.mounted) Navigator.of(context).pop(null);
      };
      return WillPopScope(
        onWillPop: () async => false,
        child: const AlertDialog(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(color: Colors.white),
            ],
          ),
        ),
      );
    },
  );
  while (clouser == null) {
    // wait until the closure variable becomes non-null.
    await Future.delayed(const Duration(milliseconds: 1));
  }
  return clouser ?? () => {};
}
