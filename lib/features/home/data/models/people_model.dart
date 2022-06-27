import 'package:actors_pedia/features/home/domain/entity/people.dart';
import 'package:actors_pedia/features/home/domain/entity/person.dart';

import 'person_model.dart';

class PeopleModel extends People {
  PeopleModel({
    int? page,
    List<Person>? personsList,
    int? totalResults,
    int? totalPages,
  }) : super(
          page: page,
          personsList: personsList,
          totalResults: totalResults,
          totalPages: totalPages,
        );

  PeopleModel.fromJson(dynamic json) {
    page = json['page'];
    if (json['results'] != null) {
      personsList = [];
      json['results'].forEach((v) {
        personsList?.add(PersonModel.fromJson(v));
      });
    }
    totalResults = json['total_results'];
    totalPages = json['total_pages'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    if (personsList != null) {
      map['results'] = personsList?.map((v) {
        PersonModel resultsModel = PersonModel(
          profilePath: v.profilePath,
          adult: v.adult,
          id: v.id,
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
