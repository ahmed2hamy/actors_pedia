import 'package:actors_pedia/core/error/failures.dart';
import 'package:actors_pedia/core/use_cases/use_case.dart';
import 'package:actors_pedia/features/home/domain/entity/people.dart';
import 'package:actors_pedia/features/home/domain/entity/home_request_body.dart';
import 'package:actors_pedia/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class GetPeopleUseCase implements UseCase<People, HomeRequestBody> {
  final HomeRepository _homeRepository;

  GetPeopleUseCase({
    required HomeRepository homeRepository,
  }) : _homeRepository = homeRepository;

  @override
  Future<Either<Failure, People>> call(HomeRequestBody requestBody) async {
    return await _homeRepository.getPeople(requestBody);
  }
}
