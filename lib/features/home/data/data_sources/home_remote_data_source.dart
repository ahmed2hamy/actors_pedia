import 'dart:developer';

import 'package:actors_pedia/constants/constants.dart';
import 'package:actors_pedia/core/error/exceptions.dart';
import 'package:actors_pedia/core/helpers/network/network_client.dart';
import 'package:actors_pedia/features/home/data/models/people_model.dart';
import 'package:actors_pedia/features/home/domain/entity/home_request_body.dart';
import 'package:actors_pedia/features/home/domain/entity/people.dart';

abstract class HomeRemoteDataSource {
  Future<People> getPeople(HomeRequestBody requestBody);
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final NetworkClient _networkClient;

  HomeRemoteDataSourceImpl({
    required NetworkClient networkClient,
  }) : _networkClient = networkClient;

  @override
  Future<People> getPeople(HomeRequestBody requestBody) async {
    try {
      Map<String, dynamic> json = await _networkClient.getData(
        endpoint: kPopularPeopleEndpoint,
        queryParameters: requestBody.toJson(),
      );

      People people = PeopleModel.fromJson(json);
      return people;
    } catch (e) {
      log(e.toString());
      throw ServerException(e.toString());
    }
  }
}
