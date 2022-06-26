import 'package:actors_pedia/core/error/failures.dart';
import 'package:actors_pedia/features/home/domain/entity/people.dart';
import 'package:actors_pedia/features/home/domain/entity/home_request_body.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Failure, People>> getPeople(HomeRequestBody requestBody);
}