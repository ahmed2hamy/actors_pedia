import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity _connectivity;

  const NetworkInfoImpl({required Connectivity connectivity})
      : _connectivity = connectivity;

  @override
  Future<bool> get isConnected async {
    ConnectivityResult result = await _connectivity.checkConnectivity();
    bool isConnected = result != ConnectivityResult.none;
    return isConnected;
  }
}
