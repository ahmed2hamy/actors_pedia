class PersonImages {
  PersonImages({
    this.id,
    this.profiles,
  });

  int? id;
  List<Profile>? profiles;
}

class Profile {
  Profile({
    this.aspectRatio,
    this.filePath,
    this.height,
    this.iso6391,
    this.voteAverage,
    this.voteCount,
    this.width,
  });

  double? aspectRatio;
  String? filePath;
  int? height;
  dynamic iso6391;
  double? voteAverage;
  int? voteCount;
  int? width;
}
