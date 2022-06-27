import 'package:actors_pedia/core/error/failures.dart';
import 'package:actors_pedia/features/person_details/data/models/person_details_request_body.dart';
import 'package:actors_pedia/features/person_details/domain/entities/person_details.dart';
import 'package:actors_pedia/features/person_details/domain/entities/person_images.dart';
import 'package:dartz/dartz.dart';

abstract class PersonDetailsRepository {
  Future<Either<Failure, PersonDetails>> getPersonDetails(
      PersonDetailsRequestBody requestBody);
  Future<Either<Failure, PersonImages>> getPersonImages(
      PersonDetailsRequestBody requestBody);
}
