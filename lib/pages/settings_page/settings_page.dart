import 'package:allocation_app/pages/settings_page/widgets/settings_form.dart';
import 'package:allocation_app/providers/allocation_provider.dart';
import 'package:allocation_app/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget{
  String email;
  SettingsPage({this.email});

  @override
  SettingsPageState createState() {
    return new SettingsPageState(userEmail: email);
  }
}

class SettingsPageState extends State<SettingsPage>{
  String userEmail;

  SettingsPageState(
    {
      @required this.userEmail
    }
  );

  @override
  Widget build(BuildContext context) {
    final allocationProvider = Provider.of<AllocationProvider>(context);
    final emailController = new TextEditingController();

    return Stack(
      children: [
        Container(
            padding: EdgeInsets.all(5.0),
            color: Colors.white70,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 50),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'email'
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 60, left: 210),
                  child: FlatButton(
                      onPressed: () {
                        allocationProvider.setEmail(emailController.text);
                      },
                      child: Text("Save Email"),
                  ),
                )
              ],
            ),
            alignment: Alignment.center
        ),
        Container(
          padding: EdgeInsets.all(5.0),
          child: Stack(
              children: [
                RaisedButton(
                  onPressed: (){
                    allocationProvider.deleteHistory(); //toDo: Make sure it only deleted specific user data
                  },
                  child: Text("Delete Data"),
                )
              ]
          ),
          alignment: Alignment.bottomCenter,
        )
      ],
    );
  }
}