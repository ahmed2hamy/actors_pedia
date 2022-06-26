import 'package:actors_pedia/core/helpers/dialogs.dart';
import 'package:actors_pedia/features/home/domain/entity/results.dart';
import 'package:actors_pedia/features/home/presentation/manger/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is HomeErrorState) {
            Dialogs.showAppSnackBar(context, content: state.errorMessage);
          }
        },
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeLoadedState) {
            List<Results> results = state.people.results ?? [];

            return ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(results[index].name ?? ''),
                );
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
