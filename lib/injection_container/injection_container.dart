import 'package:actors_pedia/core/helpers/network/network_client.dart';
import 'package:actors_pedia/core/helpers/network/network_info.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final _sl = GetIt.instance;

Future<void> init() async {
  ///Init Services:
  WidgetsFlutterBinding.ensureInitialized();

  ///Features:

  ///Core:
  _sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(connectivity: _sl<Connectivity>()),
  );
  _sl.registerLazySingleton<NetworkClient>(
    () => NetworkClient(dio: _sl<Dio>()),
  );

  ///External:
  _sl.registerLazySingleton<Connectivity>(() => Connectivity());

  _sl.registerLazySingleton<Dio>(() => Dio());
}
