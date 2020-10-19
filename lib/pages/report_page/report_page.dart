import 'package:allocation_app/pages/settings_page/widgets/settings_form.dart';
import 'package:allocation_app/services/database.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';

class ReportPage extends StatefulWidget {
  int supply;
  int recipients;
  String timestamp;
  List<String> selection;

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
  List<String> selection;

  //constructor for required
  ReportPageState({
    @required this.supply,
    @required this.recipients,
    @required this.timestamp,
    @required this.selection
  });

  @override
  void initState() {
    print(selection);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
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
            Text("Selection: $selection",
              style: TextStyle(color: Colors.blueAccent,
                fontSize: 20,
                fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}