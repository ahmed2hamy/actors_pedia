import 'package:actors_pedia/core/error/failures.dart';
import 'package:actors_pedia/features/home/domain/entity/people.dart';
import 'package:actors_pedia/features/home/domain/entity/home_request_body.dart';
import 'package:actors_pedia/features/home/domain/use_cases/get_people_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required GetPeopleUseCase getPeopleUseCase,
  })  : _getActorsUseCase = getPeopleUseCase,
        super(HomeInitialState());

  final GetPeopleUseCase _getActorsUseCase;

  Future<void> getActorsEvent(int page) async {
    emit(HomeLoadingState());

    final Either<Failure, People> res =
        await _getActorsUseCase.call(HomeRequestBody(page: page));

    res.fold(
      (l) => emit(HomeErrorState(errorMessage: l.message)),
      (r) => emit(HomeLoadedState(people: r)),
    );
  }
}