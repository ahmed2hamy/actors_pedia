import 'dart:developer';

import 'package:actors_pedia/constants/constants.dart';
import 'package:actors_pedia/core/error/exceptions.dart';
import 'package:actors_pedia/core/helpers/network/network_client.dart';
import 'package:actors_pedia/features/person_details/data/models/person_details_model.dart';
import 'package:actors_pedia/features/person_details/data/models/person_details_request_body.dart';
import 'package:actors_pedia/features/person_details/data/models/person_images_model.dart';

abstract class PersonDetailsRemoteDataSource {
  Future<PersonDetailsModel> getPersonDetails(
      PersonDetailsRequestBody requestBody);

  Future<PersonImagesModel> getPersonImages(
      PersonDetailsRequestBody requestBody);
}

class PersonDetailsRemoteDataSourceImpl
    implements PersonDetailsRemoteDataSource {
  const PersonDetailsRemoteDataSourceImpl({
    required NetworkClient networkClient,
  }) : _networkClient = networkClient;

  final NetworkClient _networkClient;

  @override
  Future<PersonDetailsModel> getPersonDetails(
      PersonDetailsRequestBody requestBody) async {
    try {
      Map<String, dynamic> json = await _networkClient.getData(
        endpoint: kPersonDetailsEndpoint(requestBody.personId),
      );

      PersonDetailsModel person = PersonDetailsModel.fromJson(json);
      return person;
    } catch (e) {
      log(e.toString());
      throw ServerException(e.toString());
    }
  }

  @override
  Future<PersonImagesModel> getPersonImages(
      PersonDetailsRequestBody requestBody) async {
    try {
      Map<String, dynamic> json = await _networkClient.getData(
        endpoint: kPersonImagesEndpoint(requestBody.personId),
      );

      PersonImagesModel images = PersonImagesModel.fromJson(json);
      return images;
    } catch (e) {
      log(e.toString());
      throw ServerException(e.toString());
    }
  }
}
