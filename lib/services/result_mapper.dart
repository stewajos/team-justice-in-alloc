import 'dart:convert';
import 'package:allocation_app/model/result_model.dart';
import 'package:allocation_app/providers/allocation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultMapper{
  ResultMapper();
  /* To help us out, here's what a result json should look like:
  * value.data = {
  *   'recipients': 5,
  *   'supply': 3
  *   'timestamp': Mon, 19 Oct 2020 03:45:36 GMT
  *   'selection': [4, 2, 5]
  * } */
  static ResultModel fromJson(String jsonString) {
    Map<String, dynamic> json = jsonDecode(jsonString);
    int supply = json["supply"];
    int recipients = json["recipients"];
    String timestamp = json["timestamp"];
    List<dynamic> dynamicLst = json["selection"];
    List<int> selection = new List<int>();
    dynamicLst.forEach((selected) {
      selection.add(selected);
    });
    //todo: Add the hashKey to this model
    ResultModel r = new ResultModel(supply: supply, recipients: recipients, timestamp: timestamp);
    return r;
  }
}