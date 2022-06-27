import 'package:actors_pedia/constants/constants.dart';
import 'package:actors_pedia/core/error/failures.dart';
import 'package:actors_pedia/core/helpers/network/network_info.dart';
import 'package:actors_pedia/features/person_details/data/data_sources/person_details_remote_data_source.dart';
import 'package:actors_pedia/features/person_details/data/models/person_details_model.dart';
import 'package:actors_pedia/features/person_details/data/models/person_details_request_body.dart';
import 'package:actors_pedia/features/person_details/data/models/person_images_model.dart';
import 'package:actors_pedia/features/person_details/domain/entities/person_details.dart';
import 'package:actors_pedia/features/person_details/domain/entities/person_images.dart';
import 'package:actors_pedia/features/person_details/domain/repositories/person_details_repository.dart';
import 'package:dartz/dartz.dart';

class PersonDetailsRepositoryImpl implements PersonDetailsRepository {
  const PersonDetailsRepositoryImpl({
    required NetworkInfo networkInfo,
    required PersonDetailsRemoteDataSource remoteDataSource,
  })  : _networkInfo = networkInfo,
        _remoteDataSource = remoteDataSource;

  final NetworkInfo _networkInfo;
  final PersonDetailsRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, PersonDetails>> getPersonDetails(
      PersonDetailsRequestBody requestBody) async {
    if (await _networkInfo.isConnected) {
      try {
        PersonDetailsModel detailsModel =
            await _remoteDataSource.getPersonDetails(requestBody);
        if (detailsModel.success) {
          return Right(detailsModel);
        } else {
          return Left(
              ServerFailure(detailsModel.statusMessage ?? kDataNotFoundString));
        }
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return const Left(ServerFailure(kNoNetworkString));
    }
  }

  @override
  Future<Either<Failure, PersonImages>> getPersonImages(
      PersonDetailsRequestBody requestBody) async {
    if (await _networkInfo.isConnected) {
      try {
        PersonImagesModel imagesModel =
            await _remoteDataSource.getPersonImages(requestBody);
        if (imagesModel.success) {
          return Right(imagesModel);
        } else {
          return Left(
              ServerFailure(imagesModel.statusMessage ?? kDataNotFoundString));
        }
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return const Left(ServerFailure(kNoNetworkString));
    }
  }
}
