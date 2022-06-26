import 'package:actors_pedia/injection_container/injection_container.dart'
    as di;
import 'package:actors_pedia/main_app.dart';
import 'package:flutter/material.dart';

void main() async {
  await di.init();
  runApp(const MainApp());
}
