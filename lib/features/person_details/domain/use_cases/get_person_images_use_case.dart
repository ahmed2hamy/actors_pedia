import 'package:actors_pedia/core/error/failures.dart';
import 'package:actors_pedia/core/use_cases/use_case.dart';
import 'package:actors_pedia/features/person_details/data/models/person_details_request_body.dart';
import 'package:actors_pedia/features/person_details/domain/entities/person_images.dart';
import 'package:actors_pedia/features/person_details/domain/repositories/person_details_repository.dart';
import 'package:dartz/dartz.dart';

class GetPersonImagesUseCase
    implements UseCase<PersonImages, PersonDetailsRequestBody> {
  final PersonDetailsRepository _personDetailsRepository;

  GetPersonImagesUseCase({
    required PersonDetailsRepository personDetailsRepository,
  }) : _personDetailsRepository = personDetailsRepository;

  @override
  Future<Either<Failure, PersonImages>> call(
      PersonDetailsRequestBody requestBody) async {
    return await _personDetailsRepository.getPersonImages(requestBody);
  }
}
