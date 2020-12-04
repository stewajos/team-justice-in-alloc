import 'package:flutter/material.dart';

class SettingsForm extends StatefulWidget {

  SettingsForm();

  @override
  _SettingsForm createState() => _SettingsForm();
}

class _SettingsForm extends State<SettingsForm>{
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextField(),
        FlatButton(
            onPressed: null,
            child: Text("Save")
        ),
        RaisedButton(
          onPressed: () {  },
          child: Text("Delete Data")
        )
      ],
    );
  }
}