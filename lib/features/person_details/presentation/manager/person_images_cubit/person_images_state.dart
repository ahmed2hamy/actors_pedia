part of 'person_images_cubit.dart';

abstract class PersonImagesState extends Equatable {
  const PersonImagesState();
}

class PersonImagesInitialState extends PersonImagesState {
  @override
  List<Object> get props => [];
}

class PersonImagesLoadingState extends PersonImagesState {
  @override
  List<Object> get props => [];
}

class PersonImagesLoadedState extends PersonImagesState {
  final PersonImages personImages;

  const PersonImagesLoadedState({
    required this.personImages,
  });

  @override
  List<Object> get props => [personImages];
}

class PersonImagesErrorState extends PersonImagesState {
  final String errorMessage;

  const PersonImagesErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
