import 'results.dart';

class People {
  People({
    this.page,
    this.results,
    this.totalResults,
    this.totalPages,
  });

  int? page;
  List<Results>? results;
  int? totalResults;
  int? totalPages;
}
