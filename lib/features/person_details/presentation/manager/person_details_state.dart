part of 'person_details_cubit.dart';

abstract class PersonDetailsState extends Equatable {
  const PersonDetailsState();
}

class PersonDetailsInitialState extends PersonDetailsState {
  @override
  List<Object> get props => [];
}

class PersonDetailsLoadingState extends PersonDetailsState {
  @override
  List<Object> get props => [];
}

class PersonDetailsLoadedState extends PersonDetailsState {
  final PersonDetails personDetails;

  const PersonDetailsLoadedState({
    required this.personDetails,
  });

  @override
  List<Object> get props => [personDetails];
}

class PersonDetailsErrorState extends PersonDetailsState {
  final String errorMessage;

  const PersonDetailsErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
