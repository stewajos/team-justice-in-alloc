import 'package:allocation_app/pages/allocation_page/widgets/allocation_list.dart';
import 'package:flutter/material.dart';

class AllocationPage extends StatefulWidget {
  @override
  _AllocationPageState createState() => _AllocationPageState();
}

class _AllocationPageState extends State<AllocationPage> {
  var recipientList = new List<String>();

  @override
  Widget build(BuildContext context) {
    TextEditingController supplyCountController = new TextEditingController();
    TextEditingController nameInputController = new TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FlatButton(onPressed: () {
              ///Add the submit button that sends data to API using the
              ///supplyCount number and the data from the name list
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
                controller: supplyCountController,
                inputFormatters: [],
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
                               nameInputController.clear();
                             }),
                             Padding(padding: EdgeInsets.only(left: 100, right:100),),
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
            Container(
              width: 1000,
              height: 400,
              child: AllocationList(
                items: recipientList,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

