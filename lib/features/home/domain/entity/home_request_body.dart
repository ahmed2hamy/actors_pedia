import 'dart:convert';

import 'package:actors_pedia/core/models/request_body.dart';

class HomeRequestBody implements RequestBody<HomeRequestBody> {
  int page;

  HomeRequestBody({required this.page});

  @override
  HomeRequestBody fromJson(String json) {
    Map<String, dynamic> map = jsonDecode(json);
    return HomeRequestBody(page: map['page']);
  }

  @override
  String toJson() {
    return jsonEncode({
      'page': page,
    });
  }
}
