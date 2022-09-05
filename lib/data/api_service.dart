import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pinterest_flutter/models/pin.dart';
import 'package:pinterest_flutter/models/user.dart';

class ApiService {
  final userPath = 'https://jsonplaceholder.typicode.com/users';
  final imagePath = 'https://fakestoreapi.com/products';

  Future<List<User>?> getUsers() async {
    List<User> allUsers = [];

    final reponse = await http.get(
      Uri.parse(userPath),
    );

    if (reponse.statusCode == 200) {
      List rawMap = jsonDecode(reponse.body);
      rawMap.forEach((element) {
        allUsers.add(
          User.fromMap(element),
        );
      });
    }
    if (allUsers.isEmpty)
      return null;
    else
      return allUsers;
  }

  Future<List<Pin>?> getPins() async {
    List<Pin> allPins = [];

    final reponse = await http.get(
      Uri.parse(imagePath),
    );

    if (reponse.statusCode == 200) {
      List rawMap = jsonDecode(reponse.body);
      rawMap.forEach((element) {
        allPins.add(
          Pin.fromMap(element),
        );
      });
    }
    if (allPins.isEmpty)
      return null;
    else
      return allPins;
  }
}
