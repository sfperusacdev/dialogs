import 'package:flutter/material.dart';

Future<T?> showKDialog<T>(
  BuildContext context, {
  bool barrierDismissible = true,
  Color? barrierColor = Colors.black54,
  bool useSafeArea = true,
  required Widget Function(BuildContext context) builder,
}) async {
  return await showDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    barrierColor: barrierColor,
    useSafeArea: useSafeArea,
    builder: builder,
  );
}
