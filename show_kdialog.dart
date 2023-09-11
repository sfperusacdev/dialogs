import 'package:flutter/material.dart';

Future<T?> showKDialog<T>(
  BuildContext context, {
  bool closeOnOutsideTab = false,
  Color? barrierColor = Colors.black54,
  bool useSafeArea = true,
  required Widget Function(BuildContext context) builder,
}) async {
  return await showDialog<T>(
    context: context,
    barrierDismissible: closeOnOutsideTab,
    barrierColor: barrierColor,
    useSafeArea: useSafeArea,
    builder: builder,
  );
}
