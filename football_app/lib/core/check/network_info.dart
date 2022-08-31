import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  late bool isconnect;
  ConnectivityResult? _connectivityResult;
  Future<bool> _checkConnectivityState() async {
    final ConnectivityResult result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.wifi ||
        result == ConnectivityResult.mobile) {
      return true;
    } else {
      return false;
    }
  }

  @override
  // TODO: implement isConnected
  Future<bool> get isConnected => _checkConnectivityState();
  /*  @override
  Future<bool> get isConnected => ConnectionStatus.online; */
}
