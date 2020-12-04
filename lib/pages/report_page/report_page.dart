import 'dart:isolate';

import 'package:allocation_app/model/recipient_model.dart';
import 'package:allocation_app/pages/report_page/widgets/selection_list.dart';
import 'package:allocation_app/pages/settings_page/widgets/settings_form.dart';
import 'package:allocation_app/providers/allocation_provider.dart';
import 'package:allocation_app/services/database.dart';
import 'package:allocation_app/services/email_service.dart';
import 'package:allocation_app/services/pdf_service.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';

import '../../theme.dart';

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

    EmailService emailService = new EmailService();
    PdfService pdfService = new PdfService();
    final allocationProvider = Provider.of<AllocationProvider>(context);
    // final File pdf ;

    return WillPopScope(
      onWillPop: () {
        allocationProvider.saveHistory(supply, allocationProvider.state.userEmail, recipients, allocationProvider.state.hashKey, timestamp, itemSelection);
        allocationProvider.resetData();
        Navigator.pop(context, false);
        Navigator.pop(context, false);
        //return a future
        return Future.value(false);
      },
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: primaryColor,
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
                style: TextStyle(color: primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              Text("Recipients: $recipients",
                style: TextStyle(color: primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              Text("Timestamp: $timestamp",
                style: TextStyle(color: primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              Expanded(
                child: SelectionList(
                  items: selection,
                ),
              ),
              FlatButton(
                minWidth: 1000,
                color: primaryColor,
                height: 40,
                child: Text("CONTINUE", style: TextStyle(color: Colors.white),),
                
                onPressed: (){
                  allocationProvider.saveHistory(supply, allocationProvider.state.userEmail, recipients, allocationProvider.state.hashKey, timestamp, itemSelection);
                  Navigator.pop(context);
                  Navigator.pop(context);
                  //emailService.sendTestEmail();
                  //get directory for the pdf service
                  // File tmp;
                  pdfService.writeTestFile(allocationProvider.state.userEmail,
                      allocationProvider.state.hashKey,
                      itemSelection, supply, recipients, timestamp).then((value) =>
                    emailService.sendResultEmail(allocationProvider.state.userEmail, value));

                  // emailService.sendResultEmail(allocationProvider.state.userEmail, tmp);

                  //TODO: Once we get the pdf service working properly, implement this line blow instead
                  //emailService.sendResultEmail(allocationProvider.state.userEmail, pdfService.resultToPdf(data));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}