import 'package:actors_pedia/core/helpers/dialogs.dart';
import 'package:actors_pedia/features/home/domain/entity/results.dart';
import 'package:actors_pedia/features/home/presentation/manger/home_cubit.dart';
import 'package:actors_pedia/features/home/presentation/widgets/home_loaded_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBodyWidget extends StatelessWidget {
  const HomeBodyWidget({
    Key? key,
    required List<Results> results,
    required ScrollController scrollController,
  })  : _results = results,
        _scrollController = scrollController,
        super(key: key);

  final List<Results> _results;
  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
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

          return HomeLoadedStateWidget(
            scrollController: _scrollController,
            results: _results,
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
