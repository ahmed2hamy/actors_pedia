import 'package:actors_pedia/features/person_details/domain/entities/person_details.dart';

class PersonDetailsModel extends PersonDetails {
  PersonDetailsModel({
    this.success = true,
    this.statusCode,
    this.statusMessage,
    String? birthday,
    String? knownForDepartment,
    int? id,
    String? name,
    List<String>? alsoKnownAs,
    int? gender,
    String? biography,
    double? popularity,
    String? placeOfBirth,
    String? profilePath,
    bool? adult,
    String? imdbId,
  }) : super(
          birthday: birthday,
          knownForDepartment: knownForDepartment,
          id: id,
          name: name,
          alsoKnownAs: alsoKnownAs,
          gender: gender,
          biography: biography,
          popularity: popularity,
          placeOfBirth: placeOfBirth,
          profilePath: profilePath,
          adult: adult,
          imdbId: imdbId,
        );

  bool success = true;
  int? statusCode;
  String? statusMessage;

  PersonDetailsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'] ?? true;
    statusCode = json['status_code'];
    statusMessage = json['status_message'];
    birthday = json['birthday'];
    knownForDepartment = json['known_for_department'];
    id = json['id'];
    name = json['name'];
    alsoKnownAs = json['also_known_as'] != null
        ? json['also_known_as'].cast<String>()
        : [];
    gender = json['gender'];
    biography = json['biography'];
    popularity = json['popularity'];
    placeOfBirth = json['place_of_birth'];
    profilePath = json['profile_path'];
    adult = json['adult'];
    imdbId = json['imdb_id'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['birthday'] = birthday;
    map['known_for_department'] = knownForDepartment;
    map['id'] = id;
    map['name'] = name;
    map['also_known_as'] = alsoKnownAs;
    map['gender'] = gender;
    map['biography'] = biography;
    map['popularity'] = popularity;
    map['place_of_birth'] = placeOfBirth;
    map['profile_path'] = profilePath;
    map['adult'] = adult;
    map['imdb_id'] = imdbId;
    return map;
  }
}
