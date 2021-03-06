import 'dart:convert';
import 'package:allocation_app/providers/allocation_provider.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class HashingService{

  HashingService();

  Map<String, dynamic> toJson(String email, int supply, int recipients, String timestamp, List<dynamic> selection){
    Map<String, dynamic> json = {
      "email": email,
      "supply": supply,
      "recipients": recipients,
      "timestamp": timestamp,
      "selection": selection,
    };

    return json;
  }

  String hashJSON(Map<String, dynamic> json){

    return sha256.convert(utf8.encode(JsonEncoder().convert(json))).toString();
  }
}

