part of 'constants.dart';

const String kBaseUrl = "https://api.themoviedb.org/3/";

const String kImagesBaseUrl = "https://image.tmdb.org/t/p/w500";

const String kPopularPeopleEndpoint = "person/popular";

String kPersonDetailsEndpoint(int personId) {
  return "person/$personId";
}

String kPersonImagesEndpoint(int personId) {
  return "person/$personId/images";
}
