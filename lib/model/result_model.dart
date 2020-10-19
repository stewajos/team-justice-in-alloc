import 'dart:convert';

class Result {
  final int supply;
  final int recipients;
  final String timestamp;
  final List<int> selection;

  Result(this.supply, this.recipients, this.timestamp, this.selection);
}