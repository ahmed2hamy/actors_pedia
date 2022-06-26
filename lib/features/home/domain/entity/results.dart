import 'known_for.dart';

class Results {
  Results({
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
