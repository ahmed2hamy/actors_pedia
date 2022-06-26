import 'package:actors_pedia/features/home/domain/entity/people.dart';
import 'package:actors_pedia/features/home/domain/entity/results.dart';

import 'results_model.dart';

class PeopleModel extends People {
  PeopleModel({
    int? page,
    List<Results>? results,
    int? totalResults,
    int? totalPages,
  }) : super(
          page: page,
          results: results,
          totalResults: totalResults,
          totalPages: totalPages,
        );

  PeopleModel.fromJson(dynamic json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(ResultsModel.fromJson(v));
      });
    }
    totalResults = json['total_results'];
    totalPages = json['total_pages'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    if (results != null) {
      map['results'] = results?.map((v) {
        ResultsModel resultsModel = ResultsModel(
          profilePath: v.profilePath,
          adult: v.adult,
          id: v.id,
          knownFor: v.knownFor,
          name: v.name,
          popularity: v.popularity,
        );

        return resultsModel.toJson();
      }).toList();
    }
    map['total_results'] = totalResults;
    map['total_pages'] = totalPages;
    return map;
  }
}
