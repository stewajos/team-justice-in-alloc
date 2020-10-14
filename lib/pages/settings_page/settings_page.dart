import 'dart:html';

import 'package:allocation_app/pages/settings_page/widgets/settings_form.dart';
import 'package:allocation_app/services/database.dart';
import 'package:flutter/material.dart';

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
                    onSubmitted: (String value) {
                      this.userEmail = value;
                    },
                    onChanged: (String value) {
                      this.userEmail = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'email'
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: FlatButton(
                      onPressed: () {
                        
                      },
                      child: Text("Save Email")
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
                  onPressed: null,
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