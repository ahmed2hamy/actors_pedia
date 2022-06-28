import 'package:actors_pedia/features/home/domain/entity/home_request_body.dart';
import 'package:actors_pedia/features/home/domain/entity/people.dart';
import 'package:actors_pedia/features/home/domain/repositories/home_repository.dart';
import 'package:actors_pedia/features/home/domain/use_cases/get_people_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  late GetPeopleUseCase useCase;
  late MockHomeRepository mockHomeRepository;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    useCase = GetPeopleUseCase(homeRepository: mockHomeRepository);
  });

  final tRequest = HomeRequestBody(page: 1);
  final tPeople = People(
    page: 1,
    personsList: [],
    totalPages: 100,
    totalResults: 100,
  );

  test(
    'should get people entity from the repository',
    () async {
      // arrange
      when(mockHomeRepository.getPeople(tRequest))
          .thenAnswer((_) async => Right(tPeople));
      // act
      final result = await useCase(tRequest);
      // assert
      expect(result, Right(tPeople));
      verify(mockHomeRepository.getPeople(tRequest));
      verifyNoMoreInteractions(mockHomeRepository);
    },
  );
}
