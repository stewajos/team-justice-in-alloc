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
    state.allocHistList = [];
    state.strHistList = [];
    notifyListeners();
  }

  AllocationState get state => _state;

  void getHistory() async{
    state.loading = true;
    try{
      prefs = await SharedPreferences.getInstance();
      state.strHistList = prefs.getStringList("testKey") != null ? prefs.getStringList("testKey") : [];
      print(state.strHistList.length);
      state.strHistList.forEach((element) {
        if(!state.allocHistList.contains(ResultModel.fromJson(json.decode(element)))){
          state.allocHistList.add(ResultModel.fromJson(json.decode(element)));
        }
      });
    }
    catch (Exception){
      print("something went wrong with the history");
    }
    state.loading = false;
  }

  void saveHistory(int supplyNum, String userEmail, int numRec, String hashKey, String timeStamp, List<String> itemSelection) async{
    state.loading = true;
    ResultModel histItem = new ResultModel(supply: supplyNum, email: userEmail, recipients: numRec, hashKey: hashKey, timestamp: timeStamp, selection: itemSelection);
    state.allocHistList.add(histItem);
    prefs = await SharedPreferences.getInstance();
    state.strHistList.add(json.encode(histItem));
    prefs.setStringList("testKey", state.strHistList);
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
    prefs.remove("testKey"); //todo: Remove this when done testing - used should not be able to delete this data unless the app is uninstalled
    notifyListeners();
    state.loading = false;
  }

  void resetList(){
    state.recipientList.clear();
    state.recipientList = new List<RecipientModel>();
    notifyListeners();
  }

  void resetData(){
    state.recipientList.clear();
    state.hashKey = "";
    state.loading = false;
    state.hasError = false;
    notifyListeners();
  }
}