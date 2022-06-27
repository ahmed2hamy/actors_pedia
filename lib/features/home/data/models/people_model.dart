import 'package:actors_pedia/features/home/domain/entity/people.dart';
import 'package:actors_pedia/features/home/domain/entity/person.dart';

import 'person_model.dart';

class PeopleModel extends People {
  PeopleModel({
    this.success = true,
    this.statusCode,
    this.statusMessage,
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

  bool success = true;
  int? statusCode;
  String? statusMessage;

  PeopleModel.fromJson(Map<String, dynamic> json) {
    success = json['success'] ?? true;
    statusCode = json['status_code'];
    statusMessage = json['status_message'];
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
    map['success'] = success;
    map['status_code'] = statusCode;
    map['status_message'] = statusMessage;
    map['page'] = page;
    if (personsList != null) {
      map['results'] = personsList?.map((v) {
        PersonModel resultsModel = PersonModel(
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
