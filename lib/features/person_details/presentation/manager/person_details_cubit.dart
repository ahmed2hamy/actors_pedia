import 'package:actors_pedia/features/person_details/data/models/person_details_request_body.dart';
import 'package:actors_pedia/features/person_details/domain/entities/person_details.dart';
import 'package:actors_pedia/features/person_details/domain/use_cases/get_person_details_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'person_details_state.dart';

class PersonDetailsCubit extends Cubit<PersonDetailsState> {
  PersonDetailsCubit({
    required GetPersonDetailsUseCase getPersonDetailsUseCase,
  })  : _getPersonDetailsUseCase = getPersonDetailsUseCase,
        super(PersonDetailsInitialState());

  final GetPersonDetailsUseCase _getPersonDetailsUseCase;

  Future<void> getPersonDetailsEvent(int personId) async {
    emit(PersonDetailsLoadingState());

    final res = await _getPersonDetailsUseCase
        .call(PersonDetailsRequestBody(personId: personId));

    res.fold((l) => emit(PersonDetailsErrorState(errorMessage: l.message)),
        (r) => emit(PersonDetailsLoadedState(personDetails: r)));
  }
}
