import 'package:actors_pedia/constants/constants.dart';
import 'package:actors_pedia/core/error/failures.dart';
import 'package:actors_pedia/core/helpers/network/network_info.dart';
import 'package:actors_pedia/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:actors_pedia/features/home/data/models/people_model.dart';
import 'package:actors_pedia/features/home/domain/entity/home_request_body.dart';
import 'package:actors_pedia/features/home/domain/entity/people.dart';
import 'package:actors_pedia/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class HomeRepositoryImpl implements HomeRepository {
  final NetworkInfo _networkInfo;
  final HomeRemoteDataSource _remoteDataSource;

  HomeRepositoryImpl({
    required NetworkInfo networkInfo,
    required HomeRemoteDataSource remoteDataSource,
  })  : _networkInfo = networkInfo,
        _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, People>> getPeople(HomeRequestBody requestBody) async {
    if (await _networkInfo.isConnected) {
      try {
        PeopleModel people = await _remoteDataSource.getPeople(requestBody);
        if (people.success) {
          return Right(people);
        } else {
          return Left(ServerFailure(people.statusMessage ?? ''));
        }
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return const Left(ServerFailure(kNoNetworkString));
    }
  }
}
