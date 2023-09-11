import 'package:flutter/material.dart';
import 'package:tareo_app/kdialogs/show_kbottom_error.dart';
import 'package:tareo_app/kdialogs/show_kdialog_confirm.dart';
import 'package:tareo_app/kdialogs/show_kloading_indicator.dart';

Future<T?> showKLoadingProcess<T>(
  BuildContext context, {
  required Future<T> Function() doProcess,
  void Function(T value)? onSuccess,
  void Function(String errMessage)? onError,
  bool retryable = false,
  bool confirmacionRequerida = false,
  String confirmacionMessage = "Are you sure you want to proceed with this operation?",
  String acceptText = "ACCEPT",
  String retryText = "RETRY",
  String? loadingMessage,
}) async {
  if (confirmacionRequerida) {
    final confirmed = await showKDialogConfirm(
      context,
      message: confirmacionMessage,
    );
    if (!(confirmed ?? false)) return null;
  }
  if (context.mounted) {
    void Function() closeloader;
    if (loadingMessage == null)
      closeloader = await showKLoadingIndicator(context);
    else
      closeloader = await showKLoadingIndicatorWithMessage(context, message: loadingMessage);
    T? results;
    try {
      results = await doProcess();
      closeloader();
      if (onSuccess != null && results != null) onSuccess(results);
    } catch (err) {
      closeloader();
      bool? retry;
      if (context.mounted)
        retry = await showKBottomErrorMessage(
          context,
          message: err.toString(),
          retryable: true,
          acceptText: acceptText,
          retryText: retryText,
        );
      if ((retry ?? false) && context.mounted) {
        return await showKLoadingProcess(
          context,
          doProcess: doProcess,
          onError: onError,
          onSuccess: onSuccess,
          retryable: retryable,
          acceptText: acceptText,
          retryText: retryText,
        );
      }
      if (onError != null) onError(err.toString());
    }
    return results;
  }
  return null;
}
