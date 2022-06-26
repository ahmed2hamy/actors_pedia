import 'package:actors_pedia/features/home/domain/entity/known_for.dart';
import 'package:actors_pedia/features/home/domain/entity/results.dart';

import 'known_for_model.dart';

class ResultsModel extends Results {
  ResultsModel({
    String? profilePath,
    bool? adult,
    int? id,
    List<KnownFor>? knownFor,
    String? name,
    double? popularity,
  }) : super(
          profilePath: profilePath,
          adult: adult,
          id: id,
          knownFor: knownFor,
          name: name,
          popularity: popularity,
        );

  ResultsModel.fromJson(dynamic json) {
    profilePath = json['profile_path'];
    adult = json['adult'];
    id = json['id'];
    if (json['known_for'] != null) {
      knownFor = [];
      json['known_for'].forEach((v) {
        knownFor?.add(KnownForModel.fromJson(v));
      });
    }
    name = json['name'];
    popularity = double.tryParse(json['popularity'].toString());
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['profile_path'] = profilePath;
    map['adult'] = adult;
    map['id'] = id;
    if (knownFor != null) {
      map['known_for'] = knownFor?.map((v) {
        KnownForModel knownForModel = KnownForModel(
          posterPath: v.posterPath,
          adult: v.adult,
          overview: v.overview,
          releaseDate: v.releaseDate,
          originalTitle: v.originalTitle,
          genreIds: v.genreIds,
          id: v.id,
          mediaType: v.mediaType,
          originalLanguage: v.originalLanguage,
          title: v.title,
          backdropPath: v.backdropPath,
          popularity: v.popularity,
          voteCount: v.voteCount,
          video: v.video,
          voteAverage: v.voteAverage,
        );

        return knownForModel.toJson();
      }).toList();
    }
    map['name'] = name;
    map['popularity'] = popularity;
    return map;
  }
}
