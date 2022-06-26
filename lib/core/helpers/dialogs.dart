import 'package:flutter/material.dart';

class Dialogs {
  Dialogs._();

  static showAppSnackBar(
    BuildContext context, {
    required String content,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(content),
        ),
      );
    });
  }
}
