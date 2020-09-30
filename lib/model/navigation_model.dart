import 'package:flutter/material.dart';

class NavigationModel {
  String title;
  IconData icon;

  NavigationModel({this.title, this.icon});
}

List<NavigationModel> navItems = [
  NavigationModel(title: "Home", icon: Icons.home),
  NavigationModel(title: "History", icon: Icons.history),
  NavigationModel(title: "Settings", icon: Icons.settings),
  NavigationModel(title: "Help", icon: Icons.help)
];