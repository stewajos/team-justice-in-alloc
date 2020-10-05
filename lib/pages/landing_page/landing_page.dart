import 'package:allocation_app/pages/landing_page/widgets/navigation_drawer.dart';
import 'package:allocation_app/services/database.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TextEditingController emailController = new TextEditingController();
    // TextEditingController participantController = new TextEditingController();
    // TextEditingController supplyQuantController = new TextEditingController();

    DatabaseService dbs = DatabaseService();
    dbs.updateCount();

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text("Home", style: TextStyle(color: Colors.white)),
      ),
      body: Stack(
        children: [
          Container(color: Colors.grey), ///This is where the list of history will go!
          NavigationDrawer(),
        ],
      ),
    );
}
}