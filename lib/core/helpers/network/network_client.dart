import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:actors_pedia/constants/constants.dart';
import 'package:dio/dio.dart';

class NetworkClient {
  final Dio _dio;

  NetworkClient({required Dio dio}) : _dio = dio {
    _dio.options = BaseOptions(
      baseUrl: kBaseUrl,
      receiveDataWhenStatusError: true,
      followRedirects: true,
      validateStatus: (status) => status! < 500,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
  }

  Future<Map<String, dynamic>> getData({
    required String endpoint,
    Options? options,
  }) async {
    try {
      Response response = await _dio.get(
        endpoint,
        options: options,
      );

      Map<String, dynamic> data = jsonDecode(response.data.toString());
      return data;
    } catch (e) {
      log(e.toString());
      throw e.toString();
    }
  }

  Future<Map<String, dynamic>> postData({
    required String endpoint,
    String? query,
    Options? options,
  }) async {
    try {
      Response response = await _dio.post(
        endpoint,
        data: query,
        options: options,
      );

      Map<String, dynamic> data = jsonDecode(jsonEncode(response.data));
      return data;
    } catch (e) {
      log(e.toString());
      throw e.toString();
    }
  }
}
