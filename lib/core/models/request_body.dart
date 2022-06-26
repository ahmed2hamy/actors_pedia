abstract class RequestBody<T> {
  T fromJson(String json);

  String toJson();
}
