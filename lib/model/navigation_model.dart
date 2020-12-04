import 'package:allocation_app/pages/help_page/help_page.dart';
import 'package:allocation_app/pages/history_page/history_page.dart';
import 'package:allocation_app/pages/home_page/home_page.dart';
import 'package:allocation_app/pages/settings_page/settings_page.dart';
import 'package:flutter/material.dart';

class NavigationModel {
  String title;
  IconData icon;
  Widget page;

  NavigationModel({this.title, this.icon, this.page});
}
