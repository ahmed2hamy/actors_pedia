import 'package:actors_pedia/core/error/failures.dart';
import 'package:actors_pedia/core/use_cases/use_case.dart';
import 'package:actors_pedia/features/person_details/data/models/person_details_request_body.dart';
import 'package:actors_pedia/features/person_details/domain/entities/person_details.dart';
import 'package:actors_pedia/features/person_details/domain/repositories/person_details_repository.dart';
import 'package:dartz/dartz.dart';

class GetPersonDetailsUseCase
    implements UseCase<PersonDetails, PersonDetailsRequestBody> {
  final PersonDetailsRepository _personDetailsRepository;

  GetPersonDetailsUseCase({
    required PersonDetailsRepository personDetailsRepository,
  }) : _personDetailsRepository = personDetailsRepository;

  @override
  Future<Either<Failure, PersonDetails>> call(
      PersonDetailsRequestBody requestBody) async {
    return await _personDetailsRepository.getPersonDetails(requestBody);
  }
}
