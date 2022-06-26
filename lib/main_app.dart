import 'package:actors_pedia/constants/constants.dart';
import 'package:actors_pedia/features/splash/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppTitleString,
      theme: kAppTheme,
      home: const SplashPage(),
    );
  }
}
