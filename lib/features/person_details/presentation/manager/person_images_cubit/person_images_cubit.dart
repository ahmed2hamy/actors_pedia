import 'package:actors_pedia/features/person_details/data/models/person_details_request_body.dart';
import 'package:actors_pedia/features/person_details/domain/entities/person_images.dart';
import 'package:actors_pedia/features/person_details/domain/use_cases/get_person_images_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'person_images_state.dart';

class PersonImagesCubit extends Cubit<PersonImagesState> {
  PersonImagesCubit({
    required GetPersonImagesUseCase getPersonImagesUseCase,
  })  : _getPersonImagesUseCase = getPersonImagesUseCase,
        super(PersonImagesInitialState());

  final GetPersonImagesUseCase _getPersonImagesUseCase;

  Future<void> getPersonImagesEvent(int personId) async {
    emit(PersonImagesLoadingState());

    final res = await _getPersonImagesUseCase
        .call(PersonDetailsRequestBody(personId: personId));

    res.fold((l) => emit(PersonImagesErrorState(errorMessage: l.message)),
        (r) => emit(PersonImagesLoadedState(personImages: r)));
  }
}
