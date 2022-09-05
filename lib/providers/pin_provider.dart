import 'package:flutter/cupertino.dart';
import 'package:pinterest_flutter/models/pin.dart';
import 'package:pinterest_flutter/data/api_service.dart';

class PinProvider extends ChangeNotifier {
  late List<Pin> allPins;
  getPinList() async {
    allPins = await ApiService().getPins() ?? [];
    notifyListeners();
    return allPins;
  }
}
