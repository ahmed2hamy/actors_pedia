import 'dart:convert';

import 'package:actors_pedia/core/helpers/network/network_client.dart';
import 'package:actors_pedia/core/helpers/network/network_info.dart';
import 'package:actors_pedia/injection_container/home_injection_container.dart';
import 'package:actors_pedia/injection_container/person_details_injection_container.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

final _sl = GetIt.instance;

Future<void> init() async {
  ///Init Services:
  WidgetsFlutterBinding.ensureInitialized();
  String apiKey = await _readApiKey();

  ///Features:
  injectHomeFeature(_sl);

  injectPersonDetailsFeature(_sl);

  ///Core:
  _sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(connectivity: _sl<Connectivity>()),
  );
  _sl.registerLazySingleton<NetworkClient>(
    () => NetworkClient(dio: _sl<Dio>(), apiKey: apiKey),
  );

  ///External:
  _sl.registerLazySingleton<Connectivity>(() => Connectivity());

  _sl.registerLazySingleton<Dio>(() => Dio());
}

Future<String> _readApiKey() async {
  final String json = await rootBundle.loadString('assets/api_key.json');
  final Map<String, dynamic> map = await jsonDecode(json);
  final String key = map['api_key']!;
  return key;
}
