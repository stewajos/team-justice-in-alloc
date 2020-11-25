import 'package:allocation_app/pages/allocation_page/widgets/allocation_list.dart';
import 'package:allocation_app/model/recipient_model.dart';
import 'package:allocation_app/providers/allocation_provider.dart';
import 'package:allocation_app/services/hashing_service.dart';
import 'package:provider/provider.dart';
//import 'package:allocation_app/model/result_model.dart';
import 'package:allocation_app/pages/report_page/report_page.dart';
import 'package:allocation_app/services/database.dart';
//import 'package:allocation_app/services/result_mapper.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';

final TextEditingController supplyCountController = new TextEditingController();

class AllocationPage extends StatefulWidget {
  @override
  _AllocationPageState createState() => _AllocationPageState();
}

class _AllocationPageState extends State<AllocationPage> {
  final _formKey = GlobalKey<FormState>();
  var recipientList = new List<String>();
  var supplyCount = 0;
  final db = new DatabaseService();
  final hs = new HashingService();
  final HttpsCallable callable = CloudFunctions.instance.getHttpsCallable(
    functionName: 'getSelection',
  );

  List<int> convertListToInt(List<dynamic> from) {
    List<int> to = new List();
    from.forEach((element) {
      to.add(element);
    });
    return to;
  }

  List<RecipientModel> filterRecipients(
      List<int> filter, List<RecipientModel> items) {
    List<RecipientModel> filteredItems = new List();
    for (int i = 0; i < filter.length; i++) {
      filteredItems.add(items[filter[i]]);
    }
    return filteredItems;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController nameInputController = new TextEditingController();
    TextEditingController autoGenController = new TextEditingController();
    final allocationProvider = Provider.of<AllocationProvider>(context);

    return GestureDetector(
      child:  Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_sharp, color: Colors.white,),
          onPressed: (){
            supplyCountController.clear();
            allocationProvider.resetList();
            Navigator.pop(context);
          },
        ),
        backgroundColor: primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FlatButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    callable.call(
                      <String, dynamic>{
                        "recipients":
                        allocationProvider.state.recipientList.length - 1,
                        "supply": int.parse(supplyCountController.text)
                      },
                    ).then((value) {
                      if (value.data != 'invalid data') {
                        List<dynamic> temp = value.data["selection"];
                        List<RecipientModel> filteredRecipients =
                        filterRecipients(convertListToInt(temp),
                            allocationProvider.state.recipientList);
                        //send results to db
                        db.sendResult(
                            value.data["recipients"].toString(),
                            value.data["supply"].toString(),
                            value.data["timestamp"].toString(),
                            temp.toString(),
                            hs.hashJSON(
                                hs.toJson("fake email://allocation_page:84ish",
                                    value.data["supply"],
                                    value.data["recipients"],
                                    value.data["timestamp"].toString(),
                                    temp)
                            )
                        );
                        //Add calculated hashkey to the provider
                        allocationProvider.state.hashKey =
                            db.hashCode.toString();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return ReportPage(
                              recipients: value.data["recipients"] + 1,
                              supply: value.data["supply"],
                              timestamp: value.data["timestamp"],
                              selection: filteredRecipients,
                            );
                          }),
                        );
                        supplyCountController.clear();
                        allocationProvider.resetList();
                      }
                      else {
                        print("Invalid Data");
                      }
                    });
                  }
                },
                child: Text(
                  "SUBMIT",
                  style: TextStyle(color: Colors.white),
                )),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 30, right: 30, top:40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Amount of Supply",
              style: TextStyle(
                  color: primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
                padding: EdgeInsets.only(top: 20),
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: supplyCountController,
                    decoration: InputDecoration(
                        labelText: "Enter Quantity",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 5.0),
                        )),
                    validator: (value) {
                      if(!RegExp(r'^[0-9]+$').hasMatch(value)){
                        print("We tried to validate the supply form");
                        return 'Please enter a number';
                      }
                      else if( int.parse(value) > allocationProvider.state.recipientList.length){
                        return 'There is more supply than recipients';
                      }
                      return null;
                    },
                  ),
                )
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            FlatButton(
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
              minWidth: 1000,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        contentPadding: EdgeInsets.all(10),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Recipient Name",
                              style: TextStyle(
                                  fontSize: 20, color: primaryColor),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: nameInputController,
                              inputFormatters: [],
                              decoration: InputDecoration(
                                  labelText: "Enter Name/ID",
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 5.0),
                                  )),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                    icon: Icon(Icons.west),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    }),
                                Padding(
                                  padding: EdgeInsets.only(left: 100),
                                ),
                                IconButton(
                                    icon: Icon(Icons.check),
                                    onPressed: () {
                                      allocationProvider.addListItem(
                                          RecipientModel(
                                              id: nameInputController.text));
                                      Navigator.pop(context);
                                    })
                              ],
                            )
                          ],
                        ),
                      );
                    });
              },
              child:
              Text("ADD RECIPIENT", style: TextStyle(color: Colors.white)),
              color: primaryColor,
            ),
            FlatButton(
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
              minWidth: 1000,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        contentPadding: EdgeInsets.all(10),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Number of Recipients",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.blueAccent),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                            ),
                            TextField(
                              keyboardType: TextInputType.text,
                              controller: autoGenController,
                              inputFormatters: [],
                              decoration: InputDecoration(
                                  labelText: "Enter Number",
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 5.0),
                                  )),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                    icon: Icon(Icons.west),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    }),
                                Padding(
                                  padding:
                                  EdgeInsets.only(left: 100, right: 60),
                                ),
                                IconButton(
                                    icon: Icon(Icons.check),
                                    onPressed: () {
                                      if (allocationProvider
                                          .state.recipientList.length >
                                          0) {
                                        allocationProvider.resetList();
                                      }
                                      var genCount =
                                      int.parse(autoGenController.text);
                                      for (var i = 0; i < genCount; i++) {
                                        setState(() {
                                          allocationProvider.addListItem(
                                              RecipientModel(
                                                  id: "# ${i + 1}" +
                                                      " " +
                                                      "Recipient"));
                                        });
                                      }

                                      Navigator.pop(context);
                                    })
                              ],
                            )
                          ],
                        ),
                      );
                    });
              },
              child:
              Text("AUTO GENERATE", style: TextStyle(color: Colors.white)),
              color: primaryColor,
            ),
            FlatButton(
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
              minWidth: 1000,
              color: primaryColor,
              child: Text("CLEAR LIST", style: TextStyle(color: Colors.white)),
              onPressed: () {
                setState(() {
                  allocationProvider.resetList();
                });
              },
            ),
            Container(
              width: 1000,
              height: 300,
              child: AllocationList(
                items: allocationProvider.state.recipientList,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 5),
              child: Text(
                "Number of entries: " +
                    (allocationProvider.state.recipientList.length > 0
                        ? (allocationProvider.state.recipientList.length)
                        .toString()
                        : "0"),
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400

                ),
              ),
            ),
          ],
        ),
      ),
    ),
      onTap: (){
        //Close the keyboard when tapping outside of the text box
        FocusScope.of(context).requestFocus(new FocusNode());
      },
    );
  }
}
