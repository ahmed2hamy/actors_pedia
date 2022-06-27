import 'person.dart';

class People {
  People({
    this.page,
    this.personsList,
    this.totalResults,
    this.totalPages,
  });

  int? page;
  List<Person>? personsList;
  int? totalResults;
  int? totalPages;
}
