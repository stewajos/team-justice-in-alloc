import 'package:allocation_app/pages/landing_page/widgets/navigation_drawer.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget{
  final String email;

  LandingPage({@required this.email,});

  @override
  Widget build(BuildContext context) {
    // TextEditingController emailController = new TextEditingController();
    // TextEditingController participantController = new TextEditingController();
    // TextEditingController supplyQuantController = new TextEditingController();

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text("Alek", style: TextStyle(color: Colors.white, fontSize: 20),),
      ),
      body: Stack(
        children: [
          Container(color: Colors.grey), ///This is where the list of history will go / other aspects
          NavigationDrawer(
            email: email,
          ),
        ],
      ),
    );
}
}