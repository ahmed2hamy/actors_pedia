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
  final ScrollController _scrollController = ScrollController();
  final List<Results> _results = [];
  int _page = 1;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _page = ++_page;
        context.read<HomeCubit>().getMorePeopleEvent(_page);
      }
    });
  }

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
            _results.addAll(state.people.results ?? []);

            return ListView.builder(
              controller: _scrollController,
              itemCount: _results.length,
              itemBuilder: (context, index) {
                if (index == _results.length - 1) {
                  return const Center(child: CircularProgressIndicator());
                }

                return ListTile(
                  title: Text(_results[index].name ?? ''),
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

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}
