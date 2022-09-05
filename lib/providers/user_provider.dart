import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:pinterest_flutter/providers/shared_prefs.dart';

class UserProvider extends ChangeNotifier {
  var ps = PreferencesService();
  bool isLoggedIn = false;

  void getLogin() async {
    await ps.checkLogin().then((value) => isLoggedIn = value ?? false);
    notifyListeners();
  }

  void switchLoginState() async {
    isLoggedIn = !isLoggedIn;
    notifyListeners();
    await ps.setLoginState(isLoggedIn);
  }

  void getUser() async {}
}
