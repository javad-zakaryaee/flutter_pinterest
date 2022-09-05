import 'package:flutter/material.dart';

var navBar = BottomNavigationBar(backgroundColor: Colors.black, items: [
  BottomNavigationBarItem(icon: Icon(Icons.house), label: 'Home'),
  BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
  BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
  BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
]);
