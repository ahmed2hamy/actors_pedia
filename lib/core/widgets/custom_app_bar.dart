import 'package:flutter/material.dart';

class CustomAppBar {
  CustomAppBar._();

  static AppBar buildAppBar({
    required BuildContext context,
    required String title,
  }) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(
          Icons.arrow_back_ios,
          color: Theme.of(context).primaryColor,
        ),
      ),
      title: Text(title),
    );
  }
}
