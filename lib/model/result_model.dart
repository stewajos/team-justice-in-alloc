import 'dart:convert';

class ResultModel {
  String email;
  int supply;
  int recipients;
  String hashKey;
  String timestamp;
  var selection;

  ResultModel({this.supply, this.email, this.recipients, this.hashKey, this.timestamp, this.selection});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new  Map<String, dynamic>();
    data['email'] =  email;
    data['supply'] = supply;
    data['recipients'] = recipients;
    data['hashKey'] = hashKey;
    data['timestamp'] = timestamp;
    data['selection'] = selection;
    return data;
  }

  ResultModel.fromJson(Map<String, dynamic> json){
    this.selection = json['selection'] as List;
    this.email = json['email'].toString();
    this.supply = int.parse(json['supply'].toString());
    this.recipients = int.parse(json['recipients'].toString());
    this.hashKey = json['hashKey'].toString();
    this.timestamp = json['timestamp'].toString();
  }

}

