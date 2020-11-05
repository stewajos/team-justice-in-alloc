import 'dart:convert';

import 'package:allocation_app/model/recipient_model.dart';
import 'package:allocation_app/model/result_model.dart';
import 'package:allocation_app/providers/allocation_state.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllocationProvider with ChangeNotifier {
  AllocationState _state;
  SharedPreferences prefs;

  AllocationProvider() {
    _state = new AllocationState();
    state.strHistList = [];
    state.allocHistList = [];
    notifyListeners();
  }

  AllocationState get state => _state;

  void getHistory() async{
    state.loading = true;
    prefs = await SharedPreferences.getInstance();
    state.strHistList = prefs.getStringList("testkey") != null ? prefs.getStringList("testkey"): [];
    notifyListeners();
    state.loading = false;
  }

  void saveHistory(int supplyNum, String userEmail, int numRec, String hashKey, String timeStamp, List<String> itemSelection) async{
    state.loading = true;
    state.allocHistList.add(new ResultModel(supply: supplyNum, email: userEmail, recipients: numRec, hashKey: "129301", timestamp: timeStamp, selection: itemSelection));
    state.strHistList.add("$timeStamp" + "\n" + "${itemSelection.length.toString()}" + " ID's Selected");
    prefs = await SharedPreferences.getInstance();
    prefs.setStringList("testkey", state.strHistList);
    notifyListeners();
    state.loading = false;
  }

  void setEmail(String email) async{
    state.userEmail = email;
    notifyListeners();
  }
    void deleteListItem(RecipientModel item){
    state.loading = true;
    state.recipientList.remove(item);
    notifyListeners();
    state.loading = false;
  }

  void addListItem(RecipientModel item){
    state.loading = true;
    state.recipientList.add(item);
    notifyListeners();
    state.loading = false;
  }

  void updateProvider(){
    notifyListeners();
  }

  void deleteHistory(){
    state.loading = true;
    state.allocHistList.clear();
    state.allocHistList = new List<ResultModel>();
    state.strHistList.clear();
    prefs.remove("testkey"); //todo: Remove this when done testing - used should not be able to delete this data unless the app is uninstalled
    notifyListeners();
    state.loading = false;
  }

  void resetList(){
    state.recipientList.clear();
    state.recipientList = new List<RecipientModel>();
    notifyListeners();
  }
}