part of '../utils/import/app_import.dart';

class AppConnectivityManager extends ChangeNotifier {
  bool isconnect = true;
  void changeIsConnect(bool value) {
    isconnect = value;
    notifyListeners();
  }

  void checkConnectitivy() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      changeIsConnect(false);
    } else {
      changeIsConnect(true);
    }
  }
}
