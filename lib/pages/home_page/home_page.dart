import 'package:allocation_app/services/database.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TextEditingController emailController = new TextEditingController();
    // TextEditingController participantController = new TextEditingController();
    // TextEditingController supplyQuantController = new TextEditingController();

    DatabaseService dbs = DatabaseService();
    dbs.updateCount();

    return Container(
      color: Colors.white70,
      child: Stack(
        children: [
          Text("This is the home page")
        ],
      )
    );
  }
}