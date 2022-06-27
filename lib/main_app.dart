import 'package:actors_pedia/constants/constants.dart';
import 'package:actors_pedia/features/home/presentation/manger/home_cubit.dart';
import 'package:actors_pedia/features/home/presentation/manger/home_scroll_to_top_provider.dart';
import 'package:actors_pedia/features/splash/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sl = GetIt.instance;

    return ChangeNotifierProvider(
      create: (_) => sl<HomeScrollToTopProvider>(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => sl<HomeCubit>()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: kAppTitleString,
          theme: kAppTheme,
          home: const SplashPage(),
        ),
      ),
    );
  }
}
