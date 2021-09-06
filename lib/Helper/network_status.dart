import 'dart:io';

import 'package:connectivity/connectivity.dart';

class NetworkStatus {

  static Future<bool> internetStatus() async {
    bool isConnected = false;
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      try {
        final result = await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          print('connected');  isConnected=true; return isConnected;
        }
      } on SocketException catch (_) {
        return isConnected;
        print('not connected');
      }
      return isConnected;

    } else
      return isConnected;
  }
}
