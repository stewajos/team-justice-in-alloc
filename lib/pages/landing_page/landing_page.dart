import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = new TextEditingController();
    TextEditingController participantController = new TextEditingController();
    TextEditingController supplyQuantController = new TextEditingController();

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent[200],
        title: Text("Allocation App", style: TextStyle(color: Colors.black),),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.only(left: 20), child: Text("Email", style: TextStyle(fontSize: 15),),)
              ],
            ),
            Container(
              padding: EdgeInsets.all(20),
              child:  TextFormField(
                controller: emailController,
                style: TextStyle(color: Colors.black),
                 decoration: InputDecoration(
                   fillColor: Colors.white,
                   filled: true,
                   hintText: "Enter Your Email",
                 ),
              )
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.only(left: 20), child: Text("Applicant Count", style: TextStyle(fontSize: 15),),)
              ],
            ),
            Container(
                padding: EdgeInsets.all(20),
                child:  TextFormField(
                  controller: participantController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Enter number of participants",
                  ),
                )
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.only(left: 20), child: Text("Supply Quantity", style: TextStyle(fontSize: 15),),)
              ],
            ),
            Container(
                padding: EdgeInsets.all(20),
                child:  TextFormField(
                  controller: supplyQuantController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Enter quantity of supplies",
                  ),
                )
            ),
            Padding(padding: EdgeInsets.only(top: 60)),
            Container(
              width: 1000,
              padding: EdgeInsets.all(20),
              child: FlatButton(
                child: Text("Continue"),
                color: Colors.lightBlueAccent[200],
                onPressed: () {
                    final userEmail = emailController.text;
                    final participantNum = participantController.text;
                    final supplyQuantity = supplyQuantController.text;

                    //ToDo: Add testing for empty values
                    ///Show dialog box when values are empty and do not continue

                    print(userEmail);
                    print(participantNum);
                    print(supplyQuantity);
                },
              ),
            ),
          ],
        ),
      ),
    );

  }
}