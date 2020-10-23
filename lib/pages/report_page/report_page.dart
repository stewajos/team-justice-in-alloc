import 'dart:isolate';

import 'package:allocation_app/model/recipient_model.dart';
import 'package:allocation_app/pages/settings_page/widgets/settings_form.dart';
import 'package:allocation_app/providers/allocation_provider.dart';
import 'package:allocation_app/services/database.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReportPage extends StatefulWidget {
  int supply;
  int recipients;
  String timestamp;
  List<RecipientModel> selection;

  ReportPage({
    @required this.supply,
    @required this.recipients,
    @required this.timestamp,
    @required this.selection
  });

  @override
  State<StatefulWidget> createState() {
    return new ReportPageState(
      supply: supply,
      recipients: recipients,
      timestamp: timestamp,
      selection: selection
    );
  }
}

class ReportPageState extends State<ReportPage>{
  int supply;
  int recipients;
  String timestamp;
  List<RecipientModel> selection;
  List<String> itemSelection;

  //constructor for required
  ReportPageState({
    @required this.supply,
    @required this.recipients,
    @required this.timestamp,
    @required this.selection
  });

  @override
  void initState() {
    itemSelection = new List<String>();
    selection.forEach((element) {
      itemSelection.add(element.id.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final allocationProvider = Provider.of<AllocationProvider>(context);
    allocationProvider.saveHistory(supply, allocationProvider.state.userEmail, recipients, "234235", timestamp, itemSelection);

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        leading: Container(),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Supply: $supply",
              style: TextStyle(color: Colors.blueAccent,
                fontSize: 20,
                fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            Text("Recipients: $recipients",
              style: TextStyle(color: Colors.blueAccent,
                fontSize: 20,
                fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            Text("Timestamp: $timestamp",
              style: TextStyle(color: Colors.blueAccent,
                fontSize: 20,
                fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            Text("Selection: $itemSelection",
              style: TextStyle(color: Colors.blueAccent,
                fontSize: 20,
                fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.only(top:100),
            ),
            FlatButton(
              minWidth: 1000,
              color: Colors.blueAccent,
              child: Text("CONTINUE", style: TextStyle(color: Colors.white),),
              onPressed: (){
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}