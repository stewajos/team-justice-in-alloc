import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = new TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Allocation App"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            Text("Email", textAlign: TextAlign.left),
            Container(
              padding: EdgeInsets.all(20),
              child:  TextField(
                 decoration: InputDecoration(
                   hintText: "Enter your email",
                 ),
              )
            ),
          ],
        ),
      ),
    );

  }
}