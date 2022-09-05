import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pinterest_flutter/components/navigation_bar.dart';
import 'package:pinterest_flutter/screens/home_page/components/body.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: navBar,
      body: Body(),
    );
  }
}
