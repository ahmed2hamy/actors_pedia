import 'package:flutter/material.dart';

class AppNavigator {
  AppNavigator._();

  static Future pushTo(
    BuildContext context, {
    required Widget widget,
  }) async {
    return await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  static Future pushReplacement(
    BuildContext context, {
    required Widget widget,
  }) async {
    await Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  static Future pushAndRemoveUntil(
    BuildContext context, {
    required Widget widget,
  }) async {
    await Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => widget),
        (Route<dynamic> route) => true);
  }
}
