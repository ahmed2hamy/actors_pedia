import 'package:actors_pedia/features/person_details/domain/entities/person_images.dart';

class PersonImagesModel extends PersonImages {
  PersonImagesModel({
    this.success = true,
    this.statusCode,
    this.statusMessage,
    int? id,
    List<Profile>? profiles,
  }) : super(
          id: id,
          profiles: profiles,
        );

  bool success = true;
  int? statusCode;
  String? statusMessage;

  PersonImagesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'] ?? true;
    statusCode = json['status_code'];
    statusMessage = json['status_message'];
    id = json['id'];
    if (json['profiles'] != null) {
      profiles = [];
      json['profiles'].forEach((v) {
        profiles?.add(ProfileModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (profiles != null) {
      map['profiles'] = profiles?.map((v) {
        ProfileModel profileModel = ProfileModel(
          aspectRatio: v.aspectRatio,
          filePath: v.filePath,
          height: v.height,
          iso6391: v.iso6391,
          voteAverage: v.voteAverage,
          voteCount: v.voteCount,
          width: v.width,
        );

        return profileModel.toJson();
      }).toList();
    }
    return map;
  }
}

class ProfileModel extends Profile {
  ProfileModel({
    double? aspectRatio,
    String? filePath,
    int? height,
    dynamic iso6391,
    double? voteAverage,
    int? voteCount,
    int? width,
  }) : super(
          aspectRatio: aspectRatio,
          filePath: filePath,
          height: height,
          iso6391: iso6391,
          voteAverage: voteAverage,
          voteCount: voteCount,
          width: width,
        );

  ProfileModel.fromJson(Map<String, dynamic> json) {
    aspectRatio = json['aspect_ratio'];
    filePath = json['file_path'];
    height = json['height'];
    iso6391 = json['iso_639_1'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['aspect_ratio'] = aspectRatio;
    map['file_path'] = filePath;
    map['height'] = height;
    map['iso_639_1'] = iso6391;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    map['width'] = width;
    return map;
  }
}
