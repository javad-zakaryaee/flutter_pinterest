import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;
import 'package:pinterest_flutter/routes/HomePage/components/gridTile.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  Future<http.Response> getJsonData() async {
    return await http.get(Uri.parse(
        'https://api.unsplash.com/photos/?client_id=jsO2UG_0WE7yNMQMG7UINrMAA0qWzyGLSh8H3wmh8GM'));
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List jsonData = [];
  fillJsonList() async {
    var response = await widget.getJsonData();
    String responseBody = await response.body;
    jsonData = jsonDecode(responseBody);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          BottomNavigationBar(backgroundColor: Colors.black, items: [
        BottomNavigationBarItem(icon: Icon(Icons.house), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
      ]),
      body: SafeArea(
          child: Center(
        child: SizedBox(
          child: FutureBuilder(
            future: fillJsonList(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return CircularProgressIndicator();
                default:
                  return SingleChildScrollView(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.85,
                      child: MasonryGridView.count(
                          crossAxisCount: 2,
                          itemCount: jsonData.length,
                          itemBuilder: (context, index) {
                            return GridTileObject(
                              jsonData: jsonData[index],
                              imageUrl: jsonData[index]['urls']['regular'],
                              rating: jsonData[index]['likes'],
                            );
                          }),
                    ),
                  );
              }
            },
          ),
        ),
      )),
    );
  }
}
