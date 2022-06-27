import 'package:actors_pedia/features/home/domain/entity/known_for.dart';

class KnownForModel extends KnownFor {
  KnownForModel({
    String? posterPath,
    bool? adult,
    String? overview,
    String? releaseDate,
    String? originalTitle,
    List<int>? genreIds,
    int? id,
    String? mediaType,
    String? originalLanguage,
    String? title,
    String? backdropPath,
    double? popularity,
    int? voteCount,
    bool? video,
    double? voteAverage,
  }) : super(
          posterPath: posterPath,
          adult: adult,
          overview: overview,
          releaseDate: releaseDate,
          originalTitle: originalTitle,
          genreIds: genreIds,
          id: id,
          mediaType: mediaType,
          originalLanguage: originalLanguage,
          title: title,
          backdropPath: backdropPath,
          popularity: popularity,
          voteCount: voteCount,
          video: video,
          voteAverage: voteAverage,
        );

  KnownForModel.fromJson(dynamic json) {
    posterPath = json['poster_path'];
    adult = json['adult'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    originalTitle = json['original_title'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<int>() : [];
    id = json['id'];
    mediaType = json['media_type'];
    originalLanguage = json['original_language'];
    title = json['title'];
    backdropPath = json['backdrop_path'];
    popularity = double.tryParse(json['popularity'].toString());
    voteCount = json['vote_count'];
    video = json['video'];
    voteAverage = double.tryParse(json['vote_average'].toString());
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['poster_path'] = posterPath;
    map['adult'] = adult;
    map['overview'] = overview;
    map['release_date'] = releaseDate;
    map['original_title'] = originalTitle;
    map['genre_ids'] = genreIds;
    map['id'] = id;
    map['media_type'] = mediaType;
    map['original_language'] = originalLanguage;
    map['title'] = title;
    map['backdrop_path'] = backdropPath;
    map['popularity'] = popularity;
    map['vote_count'] = voteCount;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    return map;
  }
}
