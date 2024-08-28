import 'dart:async';

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:stater_project/res/barrel_file.dart';

class Internetprovider extends ChangeNotifier {
  bool isConnected = true;
  StreamSubscription? _internetConnectionScription;
  Internetprovider() {
    _internetConnectionScription =
        InternetConnection().onStatusChange.listen((event) {
      print('yo internet ko event ho $event');
      switch (event) {
        case InternetStatus.connected:
          isConnected = true;
          notifyListeners();
          break;
        case InternetStatus.disconnected:
          isConnected = false;
          notifyListeners();
          break;
        default:
          isConnected = true;
          notifyListeners();
          break;
      }
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _internetConnectionScription?.cancel();
    super.dispose();
  }
}
