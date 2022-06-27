import 'package:actors_pedia/core/models/request_body.dart';

class HomeRequestBody implements RequestBody<HomeRequestBody> {
  int page;

  HomeRequestBody({required this.page});

  @override
  HomeRequestBody fromJson(Map<String, dynamic> json) {
    return HomeRequestBody(page: json['page']);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'page': page,
    };
  }
}
