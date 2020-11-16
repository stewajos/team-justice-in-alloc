import 'package:allocation_app/pages/settings_page/widgets/settings_form.dart';
import 'package:allocation_app/providers/allocation_provider.dart';
import 'package:allocation_app/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';

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
  final _formKey = GlobalKey<FormState>();

  SettingsPageState(
    {
      @required this.userEmail
    }
  );

  @override
  Widget build(BuildContext context) {
    final allocationProvider = Provider.of<AllocationProvider>(context);
    final emailController = new TextEditingController();
    final databaseService = new DatabaseService();

    var data = databaseService.getFAQ().then((value) => print(value));

    return Container(
            color: Colors.white,
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(80),
                child: AppBar(
                  elevation: 3,
                  centerTitle: true,
                  leading: Container(),
                  title: Text("\n" + "Settings"),
                  backgroundColor: primaryColor,
                ),
              ),
              body: Container(
                width: 1000,
                  height: 1000,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 15, left:20),
                      child: Text("Change Email", style: TextStyle(color: primaryColor, fontSize: 20,),),),
                    Padding(
                      padding: EdgeInsets.all(20),
                        child: Form(
                            key: _formKey,
                            child: TextFormField(
                              autofocus: false,
                              controller: emailController,
                              validator: (value) {
                                if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                                  return 'Invalid Email';
                                }
                                return null;
                              },
                              inputFormatters: [],
                              decoration: InputDecoration(
                                  labelText: "Email",
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue, width: 3.0),
                                  )
                              ),
                            )
                        )
                    ),
                    Padding(
                      padding: EdgeInsets.only(top:5, left: 20, right: 20),
                      child: FlatButton(
                          shape:new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                          color: primaryColor,
                          height: 50,
                          child: Text("SAVE EMAIL", style: TextStyle(color: Colors.white, fontSize: 15),),
                          minWidth: 1000,
                          onPressed: (){
                            if(_formKey.currentState.validate()) {
                              allocationProvider.setEmail(emailController.text);
                            }
                          },
                        ),
                      ),
                    Padding(
                      padding: EdgeInsets.only(top:350, left: 20, right: 20),
                      child: FlatButton(
                        shape:new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                        color: primaryColor,
                        height: 50,
                        child: Text("DELETE HISTORY", style: TextStyle(color: Colors.white, fontSize: 15),),
                        minWidth: 1000,
                        onPressed: (){
                          allocationProvider.deleteHistory();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
        );
  }
}