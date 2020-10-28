import 'dart:convert';

class ResultModel {
  final String email;
  final int supply;
  final int recipients;
  final String hashKey;
  final String timestamp;
  final List<String> selection;

  ResultModel({this.supply, this.email, this.recipients, this.hashKey, this.timestamp, this.selection});
}

