import 'package:actors_pedia/core/helpers/dialogs.dart';
import 'package:actors_pedia/features/home/domain/entity/person.dart';
import 'package:actors_pedia/features/home/presentation/manger/home_cubit.dart';
import 'package:actors_pedia/features/home/presentation/widgets/home_loaded_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBodyWidget extends StatelessWidget {
  HomeBodyWidget({
    Key? key,
    required ScrollController scrollController,
  })  : _scrollController = scrollController,
        _persons = [],
        super(key: key);

  final ScrollController _scrollController;
  final List<Person> _persons;

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
          _persons.addAll(state.people.personsList ?? []);

          return HomeLoadedStateWidget(
            scrollController: _scrollController,
            persons: _persons,
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
