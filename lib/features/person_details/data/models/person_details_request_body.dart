import 'package:actors_pedia/core/models/request_body.dart';

class PersonDetailsRequestBody
    implements RequestBody<PersonDetailsRequestBody> {
  int personId;

  PersonDetailsRequestBody({required this.personId});

  @override
  PersonDetailsRequestBody fromJson(Map<String, dynamic> json) {
    return PersonDetailsRequestBody(personId: json['person_id']);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'person_id': personId,
    };
  }
}
