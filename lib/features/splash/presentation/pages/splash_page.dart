import 'package:actors_pedia/constants/constants.dart';
import 'package:actors_pedia/core/helpers/app_navigator.dart';
import 'package:actors_pedia/features/home/presentation/manger/home_cubit.dart';
import 'package:actors_pedia/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getActorsEvent(1);

    Future.delayed(const Duration(seconds: 3)).then(
      (_) => AppNavigator.pushReplacement(
        context,
        widget: const HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Text(
          kAppTitleString.toUpperCase(),
          style: kWhiteBigBoldTextStyle,
        ),
      ),
    );
  }
}
