import 'package:flutter/material.dart';
import 'navigation_services.dart';

void showInSnackBar(String message) {
  BuildContext context = navigatorKey.currentContext!;
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    ),
  );
}
