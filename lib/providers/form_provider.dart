import 'package:flutter/cupertino.dart';

class FormProvider extends ChangeNotifier {
  bool isClearIconVisible = false;
  bool isPasswordVisible = false;
  var emailController = TextEditingController();

  void showClearIcon() {
    isClearIconVisible = true;
    notifyListeners();
  }

  void hideClearIcon() {
    isClearIconVisible = false;
    notifyListeners();
  }

  void clearText() {
    emailController.text = "";
    notifyListeners();
  }

  void switchPasswordVisible() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }
}
