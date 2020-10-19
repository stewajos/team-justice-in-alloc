import 'package:allocation_app/pages/allocation_page/widgets/allocation_list.dart';
import 'package:allocation_app/model/result_model.dart';
import 'package:allocation_app/pages/report_page/report_page.dart';
import 'package:allocation_app/services/result_mapper.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';

final TextEditingController supplyCountController = new TextEditingController();

class AllocationPage extends StatefulWidget {
  @override
  _AllocationPageState createState() => _AllocationPageState();
}

class _AllocationPageState extends State<AllocationPage> {
  var recipientList = new List<String>();
  var supplyCount = 0;
  final HttpsCallable callable = CloudFunctions.instance.getHttpsCallable(
    functionName: 'getSelection',
  );

  List<int> convertListToInt(List<dynamic> from){
    List<int> to = new List();
    from.forEach((element) { 
      to.add(element);      
    });
    return to;
  }
  
  List<String> filterRecipients(List<int> filter, List<String> items){
    List<String> filteredItems = new List();
    for(int i = 0; i < filter.length; i++){
      filteredItems.add(items[filter[i]]);
    }
    return filteredItems;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController nameInputController = new TextEditingController();
    TextEditingController autoGenController = new TextEditingController();

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FlatButton(
                onPressed: () {
                  callable.call(<String, dynamic>{
                    "recipients": recipientList.length,
                    "supply": 3
                  },).then((value){
                    //display report page

                    print(value.data);
                    if(value.data != 'invalid data'){
                      print(value.data["selection"]);
                      List<dynamic> temp = value.data["selection"];
                      List<String> filteredRecipients = filterRecipients(convertListToInt(temp), recipientList);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return ReportPage(
                            recipients: value.data["recipients"],
                            supply: value.data["supply"],
                            timestamp: value.data["timestamp"],
                            selection: filteredRecipients,
                          );
                        }),
                      );
                    }
                  });
                },
                child: Text("SUBMIT", style: TextStyle(color: Colors.white),)),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Amount of Supply", style: TextStyle(color: Colors.blueAccent,
                fontSize: 20,
                fontWeight: FontWeight.bold),),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: supplyCountController,
                decoration: InputDecoration(
                    labelText: "Enter Quantity", border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 5.0),
                )),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            FlatButton(
              minWidth: 1000,
              onPressed: () {
               showDialog(
                 context: context,
                 builder: (BuildContext context){
                   return AlertDialog(
                     contentPadding: EdgeInsets.all(10),
                     content: Column(
                       mainAxisSize: MainAxisSize.min,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text("Recipient Name", style: TextStyle(fontSize: 20, color: Colors.blueAccent),),
                         Padding(padding: EdgeInsets.only(top: 10),),
                         TextField(
                           keyboardType: TextInputType.text,
                           controller: nameInputController,
                           inputFormatters: [],
                           decoration: InputDecoration(
                               labelText: "Enter Name/ID", border: OutlineInputBorder(
                             borderSide: BorderSide(color: Colors.blue, width: 5.0),
                           )),
                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: [
                             IconButton(icon: Icon(Icons.west), onPressed: (){
                               Navigator.pop(context);
                             }),
                             Padding(padding: EdgeInsets.only(left: 100),),
                             IconButton(icon: Icon(Icons.check), onPressed: (){
                               setState(() {
                                 recipientList.add(nameInputController.text);
                                 Navigator.pop(context);
                               });
                             })
                           ],
                         )
                       ],
                     ),
                   );
                 }
               );
              },
              child: Text(
                  "ADD RECIPIENT", style: TextStyle(color: Colors.white)),
              color: Colors.blueAccent,
            ),
            FlatButton(
              minWidth: 1000,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        contentPadding: EdgeInsets.all(10),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Number of Recipients", style: TextStyle(fontSize: 20, color: Colors.blueAccent),),
                            Padding(padding: EdgeInsets.only(top: 10),),
                            TextField(
                              keyboardType: TextInputType.text,
                              controller: autoGenController,
                              inputFormatters: [],
                              decoration: InputDecoration(
                                  labelText: "Enter Number", border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue, width: 5.0),
                              )),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(icon: Icon(Icons.west), onPressed: (){
                                  Navigator.pop(context);
                                }),
                                Padding(padding: EdgeInsets.only(left: 100, right:60),),
                                IconButton(icon: Icon(Icons.check), onPressed: (){
                                  if(recipientList.length > 0){
                                    setState(() {
                                      recipientList = new List<String>();
                                    });
                                  }
                                  var genCount = int.parse(autoGenController.text);
                                  for(var i = 0; i < genCount; i++){
                                    setState(() {
                                      recipientList.insert(i, "# ${i+1}" + " " + "Recipient");
                                    });
                                  }
                                  Navigator.pop(context);
                                })
                              ],
                            )
                          ],
                        ),
                      );
                    }
                );
              },
              child: Text(
                  "AUTO GENERATE", style: TextStyle(color: Colors.white)),
              color: Colors.blueAccent,
            ),
            FlatButton(
              minWidth: 1000,
              color: Colors.blueAccent,
              child: Text("CLEAR LIST", style: TextStyle(color: Colors.white)),
              onPressed: (){
                setState(() {
                  recipientList.clear();
                });
              },
            ),
            Container(
              width: 1000,
              height: 300,
              child: AllocationList(
                items: recipientList,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child:  Text("Number of entries: " +  (recipientList.length > 0 ?
              (recipientList.length).toString() : "0"),
                style:  TextStyle(fontSize: 15,),),
            ),
          ],
        ),
      ),
    );
  }
}

