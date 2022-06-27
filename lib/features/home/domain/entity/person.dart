import 'package:actors_pedia/features/home/domain/entity/known_for.dart';

class Person {
  Person({
    this.profilePath,
    this.adult,
    this.id,
    this.knownFor,
    this.name,
    this.popularity,
  });

  String? profilePath;
  bool? adult;
  int? id;
  List<KnownFor>? knownFor;
  String? name;
  double? popularity;
}
