import 'dart:convert';
import 'dart:developer';

import 'package:actors_pedia/constants/constants.dart';
import 'package:actors_pedia/core/error/exceptions.dart';
import 'package:actors_pedia/core/helpers/local_cache_helper.dart';
import 'package:actors_pedia/features/home/data/models/people_model.dart';

abstract class HomeLocalDataSource {
  Future<PeopleModel> getPeople();

  Future<void> cachePeople(PeopleModel peopleModel);
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  final LocalCacheHelper _localCacheHelper;

  HomeLocalDataSourceImpl({
    required LocalCacheHelper localCacheHelper,
  }) : _localCacheHelper = localCacheHelper;

  @override
  Future<PeopleModel> getPeople() async {
    try {
      String? res = _localCacheHelper.getJson(kGetPeopleKey);

      if (res != null) {
        Map<String, dynamic> json = jsonDecode(res);
        PeopleModel people = PeopleModel.fromJson(json);
        return people;
      } else {
        throw const CacheException(kDataNotFoundString);
      }
    } catch (e) {
      log(e.toString());
      throw CacheException(e.toString());
    }
  }

  @override
  Future<void> cachePeople(PeopleModel peopleModel) async {
    try {
      bool res = await _localCacheHelper.cacheJson(
          kGetPeopleKey, jsonEncode(peopleModel.toJson()));

      if (!res) {
        throw const CacheException(kCachingErrorString);
      }
    } catch (e) {
      log(e.toString());
      throw CacheException(e.toString());
    }
  }
}
