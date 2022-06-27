import 'package:flutter/material.dart';

class CustomAppBar {
  CustomAppBar._();

  static AppBar buildAppBar({
    required BuildContext context,
    required String title,
  }) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
    );
  }
}
