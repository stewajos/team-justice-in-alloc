import 'package:allocation_app/model/navigation_model.dart';
import 'package:allocation_app/pages/allocation_page/allocation_page.dart';
import 'package:allocation_app/services/database.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TextEditingController emailController = new TextEditingController();
    // TextEditingController participantController = new TextEditingController();
    // TextEditingController supplyQuantController = new TextEditingController();

    ///DatabaseService dbs = DatabaseService();
    //dbs.updateCount();

    return Container(
      color: Colors.white70,
        child: Container(
          alignment: Alignment.center,
          child: FlatButton(
            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
            color: Colors.blue,
            height: 50,
            child: Text("NEW ALLOCATION", style: TextStyle(letterSpacing: 2, color: Colors.white),),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AllocationPage())
              );
            },
          ),
        ),
    );
  }
}