import 'package:actors_pedia/features/home/domain/entity/person.dart';

class PersonModel extends Person {
  PersonModel({
    String? profilePath,
    bool? adult,
    int? id,
    String? name,
    double? popularity,
  }) : super(
          profilePath: profilePath,
          adult: adult,
          id: id,
          name: name,
          popularity: popularity,
        );

  PersonModel.fromJson(dynamic json) {
    profilePath = json['profile_path'];
    adult = json['adult'];
    id = json['id'];
    name = json['name'];
    popularity = double.tryParse(json['popularity'].toString());
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['profile_path'] = profilePath;
    map['adult'] = adult;
    map['id'] = id;
    map['name'] = name;
    map['popularity'] = popularity;
    return map;
  }
}
